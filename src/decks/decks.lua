SMODS.Back {
    key = "Potential", -- potential man lol
    atlas = 'placeholders',
    pos = {
        x = 4,
        y = 2,
    },
    loc_text = {
        name = "The Potential Deck",
        text= {
            'Start with an eternal The Order',
            '{C:inactive,s:0.75,E:1}"If you just disable the order this deck would be great!'
        }
    },
    G.GAME.joker_rate = 1,
    G.GAME.tarot_rate = 1 ,
    G.GAME.planet_rate = 1e100,
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_order')
                    card:add_sticker('eternal', true)
                    card:add_to_deck()
                    card:start_materialize()
                    G.jokers:emplace(card)
                    return true
                end
            end,
        }))
}