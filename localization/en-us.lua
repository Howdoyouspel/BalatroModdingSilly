return {
    descriptions = {
        Joker = {
            j_hdys_Pan = {
                name = 'The PanPan',
                text = {
                    "When {C:attention}Blind{} is selected",
                    "Spawn {C:attention}2{} {C:hdys_pancake_rarity}Pancake{} Jokers",
                    "{C:inactive}(Must have room)"
                }
            },
            j_hdys_Button = {
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
            j_hdys_Bonzer = {
                name = "The Bonzu",
                text = {{
                    'This Joker gains {X:mult,C:white}X#2#{} Mult for',
                    'scored hands that contain',
                    '3 {C:attention}Stone Cards',
                    '{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive} Mult)'
                },
                }
            },
            j_hdys_pancake = {
                name = "Pancake",
                text = {{
                    '{C:chips}+#1#{} chips',
                    '{C:inactive,s:0.75,E:1}What a delicious meal to start the morning!{}'
                }}
            },
            j_hdys_butterpan = {
                name = "Buttered Pancake",
                text = {{
                    '{X:mult,C:white}X#1#{} Mult',
                    '{C:inactive,s:0.75,E:1}"Playboi Carti always puts butter on his pancake!"{}'
                }}
            },
            j_hdys_slayer = {
                name = "XXX_Slay3r_XXX",
                text = {{
                    'When {C:attention}Blind{} is selected,',
                    'destroy joker to the left',
                    'and create one {C:hdys_pancake_rarity}Buttered Pancake{} Joker'
                }}
            }

        },
        hdys_terrarcana = {
            c_hdys_terrarian2 = {
                name = 'Terraria Test',
                text = {
                    'this is a test',
                    'if your seeing this',
                    'congrats! it worked'
                }
            }
        },
        Spectral = {
            c_hdys_DTPRsteven = {
                name = 'Spectral Steven',
                text = {
                    'Creates a random',
                    '{C:green} Terraria{} Joker'
                }
            }
        },
        Other = {
            --[[
            p_hdys_booster2 = {
                    name = "Terrarcana Pack",
                    text = {
                        'Choose {C:attention}#1#{} of up to',
                        '{C:attention}#2#{C:hdys_terrarcana} Terrarot{} cards'
                    }
            },
            ]] -- not needed at the current moment
            p_hdys_terrariaboost = {
                name = "Terraria Pack",
                text = {
                    'Choose {C:attention}#1#{} of up to',
                    '{C:attention}#2#{C:green} Terraria{} jokers'
                }
            },
            undiscovered_hdys_terrarcana = {
                name = 'Undiscovered Terrarcana',
                text = {
                    "Purchase or use",
                    "this card in an",
                    "unseeded run to",
                    "learn what it does",
                    }
            },
        },
    },
    misc = {
        dictionary = {

            -- b_hdys_terrarcana_cards = 'Terrarcana', not needed
            -- k_hdys_terrarcana = 'Terrarcana',
            -- k_hdys_terrconsume = 'Terrarcana Pack',
            k_hdys_terrpack = 'Terraria Pack',
            k_hdys_pancake_rarity = 'Pancake'
        },
        labels = {
            -- hdys_terrarcana = 'Terraria'
            hdys_pancake_rarity = 'Pancake'
        }
    }
}