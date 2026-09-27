SMODS.Joker {
    key = 'rock',
    atlas = '12b',
    pos = {
        x = 1,
        y = 0
    },
    config = {
        extra = {
            base_xmult = 1,
            xmult_gain = 0.1,
        }
    },
    rarity = 3,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone

        local stone_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_stone') then
                    stone_tally = stone_tally + 1
                end
            end
        end


        return {
            vars = {
                card.ability.extra.base_xmult,
                card.ability.extra.xmult_gain,
                card.ability.extra.base_xmult + card.ability.extra.xmult_gain * stone_tally
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and SMODS.has_enhancement(context.other_card, 'm_stone') == true then
            local stone_tally = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_stone') then
                    stone_tally = stone_tally + 1
                end
            end
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                return {
                    x_mult = card.ability.extra.base_xmult + card.ability.extra.xmult_gain * stone_tally
                }
            end
        end
    end,
}