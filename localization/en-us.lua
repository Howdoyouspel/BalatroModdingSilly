return {
    descriptions = {
        Joker = {
            j_xmpl_joker1 = {
                name = 'The PanPan',
                text = {
                    "{C:chips}+#1#{} chips"
                }
            },
            j_xmpl_joker2 = {
                name = 'The Button',
                text = {
                    {
                    'Gives {C:money}$#1#{} for each',
                    'The PanPan sold'},
                    {
                        'Money scales by {C:attention}#2#',
                        'for each The PanPan sold',
                        '{C:inactive}(Resets at the end of round)'
                    },
                    {'{C:inactive}W.I.P'}

                }
            },
            j_xmpl_joker3 = {
                name = "The Bonzu",
                text = {{
                    'This Joker gains {X:mult,C:white}X#2#{} Mult for',
                    'scored hands that contain',
                    '3 {C:attention}Stone Cards',
                    '{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive} Mult)'
                },

                }
            }
        }
    }
}