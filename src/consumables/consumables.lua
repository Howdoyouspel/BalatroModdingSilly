SMODS.ConsumableType {
    key = 'hdys_terraria',
    primary_colour = HEX('00FF00'),
    secondary_colour = HEX('8F00FF')
    default = 'c_hdys_terrarian2'
    shop_rate = 0,  
}


SMODS.Consumable {
    key = 'terrarian2'
    atlas = 'placeholders'
    pos = {
        x = 1,
        y = 2
    },
    config = {
        extra = {
            dollars = 5
        }
    }
    set = 'hdys_terraria'
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.exrta.dollar
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