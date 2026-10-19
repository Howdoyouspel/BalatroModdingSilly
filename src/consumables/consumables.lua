--[[ will be used for later purposes probably
SMODS.ConsumableType {
    key = 'hdys_terrarcana',
    primary_colour = HEX('00FF00'),
    secondary_colour = HEX('8F00FF'),
    default = 'c_hdys_terrarian2',
    shop_rate = 0,
}


SMODS.Consumable {
    key = 'terrarian2',
    atlas = 'placeholders',
    pos = {
        x = 1,
        y = 2
    },
    config = {
        extra = {
            dollars = 5
        }
    },
    set = 'hdys_terrarcana',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollar
            }
        }
    end,
    use = function(self, card, area, copier)
        ease_dollars(card.ability.extra.dollars)
    end,
    can_use = function(self, card)
        return G.GAME.blind
    end, 
}
]]

SMODS.Consumable {
    key = 'DTPRsteven',
    atlas = 'placeholders',
    pos = {
        x = 2,
        y = 2
    },
    config = {},
    cost = 4,
    set = 'Spectral',
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound("timpani")
                local card = create_card("hdys_Terrarian", G.jokers, nil, 0.5, nil, nil, nil, 'jok')
                card:add_to_deck()
                G.jokers:emplace(card)
                card:juice_up(0.3,0.5)
                return true
            end,
        }))
    end,
    can_use = function(self, card)
        	return #G.jokers.cards < G.jokers.config.card_limit
    end,
}