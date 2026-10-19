-- terrarian jokers, gotta keep ts organized yo
SMODS.ObjectType({
    key = "hdys_Terrarian",
    default = "j_joker",
    cards = {
        ['j_vagabond'] = true,
        ['j_even_steven'] = true,
        ['j_square'] = true
    },
})



SMODS.Joker {
    key = "Pan", -- the panpan
    atlas = "placeholders",
    pos = {
        x = 0,
        y = 0
    },
    pools = {['hdys_Terrarian'] = true},
    rarity = 1,
    cost = 3,
    calculate = function(self, card, context)
        if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            local jokers_to_create = math.min(2, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
            G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
            G.E_MANAGER:add_event(Event({
                func = function()
                    for i = 1, jokers_to_create do
                        local card = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_hdys_pancake')
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        card:start_materialize()
                        G.GAME.joker_buffer = 0
                    end
                    return true
                end
            }))
        end
    end
}

SMODS.Joker {
    key = "Button", -- the button
    atlas = "placeholders",
    pos = {
        x = 2,
        y = 0
    },
    config = {
        extra = {
            dollars = 1,
            reset = 1,
            scalar = 1
        }
    },
    pools = {['hdys_Terrarian'] = true},
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.scalar
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit('Clubs') then
            SMODS.calculate_effect({dollars = card.ability.extra.dollars}, context.other_card)
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = 'dollars',
                scalar_value = "scalar",
                message_colour = G.C.ATTENTION
            })
        end
        if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
            card.ability.extra.dollars = card.ability.extra.reset
            return{
                message = localize('k_reset')
            }
        end
    end
}

SMODS.Joker {
    key = "Bonzer", --bonzu joker
    atlas = "placeholders",
    pos = {
        x = 3,
        y = 0
    },
    config = {
        extra = {
            Xmult = 1,
            Xmult_Gain = 0.5
        }
    },
    pools = {['hdys_Terrarian'] = true},
    rarity = 2,
    cost = 6,
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