SMODS.Joker {
    key = 'equalizer',
    atlas = 'placeholders',
    pos = {
        x = 1,
        y = 0
    },
    config = {
        extra = {
            max_score = 0,
            max_score_mult = 0,
            max_score_chips = 0,
        }
    },
    rarity = 2,
    cost = 8,
    blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.max_score,
                card.ability.extra.max_score_mult,
                card.ability.extra.max_score_chips
            }
        }
    end,


    calculate = function(self, card, context)
        if context.final_scoring_step then
            local current_chips = hand_chips
            local current_mult = mult
            local current_score = current_chips * current_mult
            if current_score >= card.ability.extra.max_score then
                card.ability.extra.max_score_mult = current_mult
                card.ability.extra.max_score_chips = current_chips
                card.ability.extra.max_score = current_score
            else
                hand_chips = card.ability.extra.max_score_chips
                mult = card.ability.extra.max_score_mult
                card.ability.extra.max_score_mult = 0
                card.ability.extra.max_score_chips = 0
                card.ability.extra.max_score = 0
                
                -- Plasma deck-type effect

                G.E_MANAGER:add_event(Event({
                    func = (function()
                        local text = localize('k_balanced')
                        play_sound('gong', 0.94, 0.3)
                        play_sound('gong', 0.94*1.5, 0.2)
                        play_sound('tarot1', 1.5)
                        ease_colour(G.C.UI_CHIPS, {0.4, 0.4, 0.4, 1})
                        ease_colour(G.C.UI_MULT, {0.4, 0.4, 0.4, 1})
                        attention_text({
                            scale = 1.4, text = text, hold = 2, align = 'cm', offset = {x = 0,y = -2.7},major = G.play
                        })
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            blockable = false,
                            blocking = false,
                            delay =  4.3,
                            func = (function() 
                                    ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
                                    ease_colour(G.C.UI_MULT, G.C.RED, 2)
                                return true
                            end)
                        }))
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            blockable = false,
                            blocking = false,
                            no_delete = true,
                            delay =  6.3,
                            func = (function() 
                                G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
                                G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED[4]
                                return true
                            end)
                        }))
                        return true
                    end)
                }))     

            end
        end
    end
}