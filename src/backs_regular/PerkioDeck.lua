SMODS.Back {
    key = "perkiodeck",
    atlas = "12b",
    pos = { x = 0, y = 2 },

    calculate = function(self, back, context)

         -- Duplicate joker

        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then

            local jokers = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card then
                    jokers[#jokers + 1] = G.jokers.cards[i]
                end
            end

            if #jokers > 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local card_to_copy, _ = pseudorandom_element(jokers, '12b_perkeo_deck')
                        local copied_card = SMODS.copy_card(card_to_copy)
                        copied_card:set_edition("e_negative", true)
                        return true
                    end
                }))
                return { message = localize('k_duplicated_ex') }
            end
        end
    end
}