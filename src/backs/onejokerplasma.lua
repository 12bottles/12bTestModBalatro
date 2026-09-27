SMODS.Back {
    key = "onejokerplasma",
    atlas = "12b",
    pos = { x = 2, y = 3 },
    config = { 
        joker_ids = {"j_mime"},
        extra_joker_slot = 1,
        joker_names = "Mime",
        ante_scaling = 2
    },
    loc_vars = function(self, info_queue, back)
        return { 
            vars = { 
                self.config.jokers,
                self.config.extra_joker_slot,
                self.config.joker_names,
                self.config.ante_scaling
            } 
        }
    end,

    apply = function(self, back)
        G.GAME.starting_params.joker_slots = self.config.extra_joker_slot
        
         -- Apply the consumables
        delay(0.4)
        G.GAME.starting_params.ante_scaling = self.config.ante_scaling
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, consumable_key in ipairs(self.config.joker_ids) do
                    SMODS.add_card({ key = consumable_key })
                end
                return true
            end
        }))
    end,

    calculate = function(self, back, context)
        if context.final_scoring_step then
            return {
                balance = true
            }
        end

        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
            G.jokers.config.card_limit = G.jokers.config.card_limit + self.config.extra_joker_slot
            for _, joker_key in ipairs(self.config.joker_ids) do
                SMODS.add_card({ key = joker_key })

                --local card = create_card('Joker', G.jokers, nil, nil, nil, nil, joker_key, 'dozenb')
                --card:add_to_deck()
                --G.jokers:emplace(card)
            end
        end
    end,
}