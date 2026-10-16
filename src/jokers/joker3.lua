SMODS.Joker {
    key = "joker3", --bonzu joker
    atlas = "placeholders",
    pos = {
        x = 3,
        y = 0
    },
    config = {
        extra = {
            Xmult = 1,
            Xmult_Gain = 0.25
        }
    },
    rarity = 3,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone

        return {vars = {card.ability.extra.Xmult, card.ability.extra.Xmult_Gain} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local stone_count = 0
            for i = 1, #context.scoring_hand do
                if SMODS.has_enhancement(context.scoring_hand[i], "m_stone") then
                    stone_count = stone_count + 1
                end
            end

            if stone_count >= 3 then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'Xmult',
                    scalar_value = "Xmult_Gain",
                    message_colour = G.C.MULTIPLIER
                })
            end
            return { xmult = card.ability.extra.Xmult }
        end
    end,
}