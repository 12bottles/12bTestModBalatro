SMODS.Joker {
    key = 'astromancer',
    atlas = 'placeholders',
    pos = {
        x = 1,
        y = 0
    },
    config = {
        extra = {
            odds = 2,
        }
    },
    rarity = 2,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'dozenb_astromancer')
        return { vars = { numerator, denominator} }
    end,

    calculate = function (self, card, context)

        if context.end_of_round and context.main_eval and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit and 
        SMODS.pseudorandom_probability(card, 'dozenb_astromancer', 1, card.ability.extra.odds) then

            local _planet, _hand, _tally = nil, nil, 0
            for _, handname in ipairs(G.handlist) do
                if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally then
                    _hand = handname
                    _tally = G.GAME.hands[handname].played
                end
            end
            if _hand then
                for _, v in pairs(G.P_CENTER_POOLS.Planet) do
                    if v.config.hand_type == _hand then
                        _planet = v.key
                    end
                end
            end



            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1



            G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if _planet then
                                SMODS.add_card({ key = _planet })
                                G.GAME.consumeable_buffer = 0
                                return true
                            end
                        end 
                    }))
                    SMODS.calculate_effect({ message = localize('k_plus_planet'), colour = G.C.PURPLE },
                        context.blueprint_card or card)
                    return true
                end)
            }))
            return nil, true -- This is for Joker retrigger purposes
        end
    end,
}