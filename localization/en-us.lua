return {
    descriptions = {
        Back = {
            b_dozenb_onejoker = {
                name = "One Joker Deck",
                text = {"Start with a {C:clubs}[#3#]{}.",
                        "Gives one {C:clubs}[#3#]{}",
                        "every Ante."
                },
            },

            b_dozenb_onejokerplasma = {
                name = "One Joker Deck [Plasma]",
                text = {
                        "Start with a {C:clubs}[#3#]{}.",
                        "Gives one {C:clubs}[#3#]{}",
                        "every Ante.",
                        "Has the effects of the",
                        "Plasma deck."
                },
            },

            b_dozenb_paintedplus = {
                name = "Painted+ Deck",
                text = {
                        "{C:money}+#1#{} hand size every",
                        "Ante."
                },
            }
        },



        Joker = {
            j_dozenb_joker1 = {
                name = 'The Joker1',
                text = {
                    '{C:chips}+#1#{} chips'
                }
            },

            j_dozenb_joker2 = {
                name = 'The Joker2',
                text = {
                    {
                        'Gives {C:money}$#1#{} for each',
                        'scoring {C:clubs}Club{} card'
                    },{
                        'Money scales by {C:attention}#2#{}',
                        'every trigger',
                        '{C:inactive}(Resets at end of round){}'
                    }
                }
            },

            j_dozenb_joker3 = {
                name = 'The Joker3',
                text = {
                    {
                        '{C:red}+#1#{} Discards when held'
                    }, {
                        'Gives {C:money}money{} equal to number',
                        'of {C:red}discards{} remaining at',
                        'end of round'
                    }
                }
            },

            j_dozenb_dozen = {
                name = 'Dozen Joker',
                text = {
                    {
                        '{C:money}+$#1#{} at end of round'
                    }, {
                        'Earn {C:money}$#2#{} extra for',
                        'every {C:attention}#3#{C:inactive} [#4#]{} cards',
                        'discarded.'
                    }
                },
            },

            j_dozenb_rock = {
                name = 'Medusa',
                text = {
                    {
                        '{X:mult,C:white} X#3# {} Mult for each',
                        '{C:attention}Stone{} card in hand.'
                    }, {
                        'Gains {X:mult,C:white} X#2# {} Mult for',
                        'each {C:attention}Stone{} card in',
                        'your full deck'
                    }
                },
            },


            j_dozenb_joker4 = {
                name = 'Joker4',
                text = {
                    'All shop boosters',
                    'are {C:money}free'
                }
            },
            j_dozenb_joker5 = {
                name = 'Joker5',
                text = {
                    'All shop items',
                    'cost {C:money}half{} as much'
                }
            }
        }
    }
}

--[===[ j_dozenb_dozen = {
                name = 'Dozen Joker',
                text = {
                    {
                        '{C:money}+#1#{} at end of round'
                    }, {
                        'Earn {C:money}$#2#{} extra for',
                        'every {C:attention}#3#{C:inactive} [#4#]{} cards',
                        'discarded.'
                    }
                },
                unlock = {
                    "{E:1,s:1.3}?????",
                },
            } --]===]