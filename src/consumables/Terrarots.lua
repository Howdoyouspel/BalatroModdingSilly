-- idk if i should make these part of two pools or its own pool cause idk how this works lowk

SMODS.Consumable {
    key = 'mason', -- stone mason
    atlas = 'placeholders',
    pos = {
        x = 1,
        y = 2,
    },
    config = {
        max_highlighted = 5,
        mod_conv = 'm_stone'
    },
    cost = 3,
    set = 'Tarot',
    loc_vars = function (self, info_queue, card)
         info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
    -- i guess you dont need to write how the use function works since the config already handles that, did not know that
    -- also idk what the localize thing does tbh im just copying what works
}

-- volcanic enhancement
SMODS.Enhancement {
    key = 'volcanic',
    atlas = 'placeholders',
    pos = {
        x = 0,
        y = 0,
    },
    config = {},
    calculate = function (self, card, context)
        local other_card = nil
        for i = 1, #context.cardarea do
            if context.cardarea[i] == card then other_card = context.scoring_hand[i+1] end
        end   
        print(other_card)
        local ret = SMODS.blueprint_effect(card, other_card, context)
        if ret then
            ret.colour = G.C.BLUE
        end
        return ret
    end
}
