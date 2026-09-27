SMODS.Joker {
    key = 'dozen',
    atlas = '12b',
    blueprint_compat = false,
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            dollars = 0,
            dollars_gain = 1,
            discards = 12,
            discards_remaining = 12
        }
    },
    rarity = 3,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.dollars_gain,
                card.ability.extra.discards,
                card.ability.extra.discards_remaining,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.discard and not context.blueprint then
            if card.ability.extra.discards_remaining <= 1 then
                card.ability.extra.discards_remaining = card.ability.extra.discards
                -- See note about SMODS Scaling Manipulation on the wiki
                card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollars_gain
                return {
                    -- message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.dollars } },
                    message = '+$' .. tostring(card.ability.extra.dollars),
                    colour = G.C.GOLD,
                    delay = 0.2
                }
            else
                card.ability.extra.discards_remaining = card.ability.extra.discards_remaining - 1
                return nil, true -- This is for Joker retrigger purposes
            end
        end
    end,

    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end,
}