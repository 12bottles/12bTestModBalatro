SMODS.Back {
    key = "paintedplus",
    atlas = "12b",
    pos = { x = 2, y = 2 },
    config = { 
        extra_hand_size = 1
    },
    loc_vars = function(self, info_queue, back)
        return { 
            vars = { 
                self.config.extra_hand_size,
            } 
        }
    end,


    calculate = function(self, back, context)
        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
            G.hand:change_size(self.config.extra_hand_size)
        end
    end,
}