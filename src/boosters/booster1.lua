SMODS.Booster {
    key = 'terrariaboost',
    config = {
        choose = 1,
        extra = 4,
    },
    group_key = 'k_hdys_terrpack',
    weight = 1,
    kind = 'Terrarian',
    create_card = function(self, card, i)
        return {set = 'hdys_Terrarian', area = G.pack_cards, skip_materialize = true}
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { math.min(card.ability.choose + (G.GAME.modifiers.booster_choice_mod or 0), math.max(1, card.ability.extra + (G.GAME.modifiers.booster_size_mod or 0))), math.max(1, card.ability.extra + (G.GAME.modifiers.booster_size_mod or 0)) } }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Tarot)
        ease_background_colour({ new_colour = G.C.SET.Tarot, special_colour = G.C.BLACK, contrast = 2 })
    end,
}

--[[

code will be repurposed in the future

SMODS.Booster {
    key = 'booster2',
    config = {
        choose = 1,
        extra = 4,
    },
    group_key = 'k_hdys_terrconsume',
    weight = 1,
    kind = 'TerPack',
    create_card = function(self, card, i)
        return {set = 'hdys_terrarcana', area = G.consumeables, skip_materialize = true}
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { math.min(card.ability.choose + (G.GAME.modifiers.booster_choice_mod or 0), math.max(1, card.ability.extra + (G.GAME.modifiers.booster_size_mod or 0))), math.max(1, card.ability.extra + (G.GAME.modifiers.booster_size_mod or 0)) } }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Tarot)
        ease_background_colour({ new_colour = G.C.SET.Tarot, special_colour = G.C.BLACK, contrast = 2 })
    end,
}
]] 
