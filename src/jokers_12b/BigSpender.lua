SMODS.Joker {
    key = 'bigspender',
    atlas = '12b',
    pos = {
        x = 1,
        y = 2
    },
    config = {
        extra = {
            money_spent = 0,
            money_to_spend = 10,
            mult = 0,
            mult_gain = 2,
            money_remaining = 10
        }
    },
    rarity = 2,
    cost = 9,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.money_spent,
                card.ability.extra.money_to_spend,
                card.ability.extra.mult,
                card.ability.extra.mult_gain,
                card.ability.extra.money_remaining
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end

        -- For joker retriggering 

        if (context.buying_card or context.open_booster or context.reroll_shop) and not context.blueprint then
            local remainder = 0
            local upgraded = false

            if context.buying_card or context.open_booster then
                card.ability.extra.money_spent = card.ability.extra.money_spent + context.card.cost
            elseif context.reroll_shop then
                card.ability.extra.money_spent = card.ability.extra.money_spent + context.cost
            end
            
            while card.ability.extra.money_spent >= card.ability.extra.money_to_spend do
                remainder = card.ability.extra.money_spent - card.ability.extra.money_to_spend
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                card.ability.extra.money_spent = remainder
                upgraded = true
            end
            
            -- For display only, probably a better way to do this.
            card.ability.extra.money_remaining = card.ability.extra.money_to_spend - card.ability.extra.money_spent

            if upgraded then
                return {
                    message = 'Upgraded!',
                    colour = G.C.YELLOW
                }
            else

                -- For debugging

                return {
                    message = 'Money Spent!',
                    colour = G.C.YELLOW
                }
            end

        end
    end
}