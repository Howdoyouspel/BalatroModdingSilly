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