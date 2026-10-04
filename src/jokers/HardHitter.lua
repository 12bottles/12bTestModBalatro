SMODS.Joker {
    key = 'hardhitter',
    atlas = 'placeholders',
    pos = {
        x = 2,
        y = 0
    },
    config = {
        extra = {
            xmult = 4,
            status = 'Active'
        }
    },
    rarity = 3,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.status
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and #context.full_hand >= 5 then
            if card.ability.extra.status == 'Active' then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end

        -- For joker retriggering 

        if context.final_scoring_step and #context.full_hand >= 5 then
            card.ability.extra.status = 'Inactive'
        end


        if context.end_of_round and context.main_eval then
            card.ability.extra.status = 'Active'
        end

    end
}