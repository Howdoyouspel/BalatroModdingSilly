SMODS.Back {
    key = "potential", -- potential man lol
    atlas = 'placeholders',
    pos = {
        x = 4,
        y = 2,
    },
    apply = function(self)
        G.GAME.joker_rate = 1
        G.GAME.tarot_rate = 1 
        G.GAME.planet_rate = 1e100
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_order')
                    card:add_sticker('eternal', true)
                    card:add_sticker('rental', true)
                    card:add_to_deck()
                    card:start_materialize()
                    G.jokers:emplace(card)
                    return true
                end
            end,
        }))
    end
}