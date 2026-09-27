return {
    descriptions = {
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
                name = 'Joker3',
                text = {
                    {
                        '{C:red}+#1#{} Discards when held'
                    }, {
                        'Gives {C:money}money{} equal to number',
                        'of {C:red}discards{} remaining at',
                        'end of round'
                    }
                }
            }
        }
    }
}