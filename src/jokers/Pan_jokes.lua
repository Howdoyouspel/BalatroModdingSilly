-- pancake jokers???? man what the hell is panpan talkin abouts, these jokers can only be spawned by The PanPan, or the Slayer or whatever i dunno im not sure actually
SMODS.ObjectType({
    key = 'hdys_ilovepancakes', -- dont call it pan cus otherwise there would be conflicts with The PanPan since they share the same key
    default = 'hdys_pancake',
    cards = {}
})

-- create new rarity type pancake, must be its own rarity so that it never spawns, and also does not get spawned by riff raff
SMODS.Rarity({
    key = 'hdys_pancake_rarity',
    badge_colour = HEX('F2C27A'),
    pools = {
        ['hdys_ilovepancakes'] = { weight = 0.00 } -- hopefully this ensures that it doesn't spawn any of the pancake style jokers in the shop
    }
})

SMODS.Joker {
    key = 'slayer', -- slayer idk where else to put this joker lol despite it not being in this pool
    atlas = 'placeholders',
    pos = {
        x = 2,
        y = 0
    },
    rarity = 3,
    cost = 6,
    calculate = function (self, card, context)
        local my_pos = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                my_pos = i
                break
            end
        end
        if context.setting_blind and not (context.blueprint or self).getting_sliced and my_pos and G.jokers.cards[my_pos + 1] and not SMODS.is_eternal(G.jokers.cards[my_pos + 1]) and not G.jokers.cards[my_pos + 1].getting_sliced then
            local sliced_card = G.jokers.cards[my_pos + 1]
            sliced_card.getting_sliced = true
            G.GAME.joker_buffer = G.GAME.joker_buffer - 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.joker_buffer = 0
                    card:juice_up(0.8,0.8)
                    sliced_card:start_dissolve({HEX('57ecab'), nil, 1.6})
                    play_sound('slice1',0.96 + math.random()*0.08)
                    return true
                end,
            }))
            local card = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_hdys_pancake')
            card:add_to_deck()
            G.jokers:emplace(card)
        end
    end
}

SMODS.Joker {
    key = 'pancake', -- Pancake joker
    atlas = 'placeholders',
    pos = {
        x = 0,
        y = 0,
    },
    config = {
        extra = {
            chips = 50
        }
    },
    pools = {['hdys_ilovepancakes'] = true},
    rarity = 'hdys_pancake_rarity',
    cost = 2,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
} 

SMODS.Joker {
    key = 'butterpan',
    atlas = 'placeholders',
    pos = {
        x = 4,
        y = 0,
    },
    config = {
        extra = {
            xmult = 1.5
        }
    },
    pools = {['hdys_ilovepancakes'] = true},
    rarity = 'hdys_pancake_rarity',
    cost = 2,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return{
                xmult = card.ability.extra.xmult
            }
        end
    end
}