SMODS.Joker {
    key = 'flushedaway',
    atlas = '12b',
    blueprint_compat = true,
    pos = {
        x = 3,
        y = 1
    },
    config = {
        extra = {
            xmult = 1,
            xmult_gain = 0.75
        }
    },
    rarity = 2,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmult_gain,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.pre_discard and not context.hook and not context.blueprint then
            local text, _ = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
            if text == 'Straight Flush' then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
                return {
                    message = 'Flused Away!',
                    colour = G.C.BLUE
                }
            end
            
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,

}