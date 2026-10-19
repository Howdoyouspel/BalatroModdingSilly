-- pancake jokers???? man what the hell is panpan talkin abouts, these jokers can only be spawned by The PanPan
SMODS.ObjectType({
    key = 'hdys_PanJoking', -- dont call it pan cus otherwise there would be conflicts with The PanPan since they share the same key
    default = 'hdys_Pan',
    cards = {}
})

-- create new rarity type pancake, must be its own rarity so that it never spawns, and also does not get spawned by riff raff
SMODS.Rarity({
    key = 'hdys_pancake_rarity',
    pools = {
        ['hdys_PanJoking'] = { weight = 0.00 } -- hopefully this ensures that it doesn't spawn any of the pancake style jokers in the shop
    }
})

SMODS.Joker {
    key = 'pancake', -- Pancake joker
    atlas = 'Placeholders',
    pos = {
        x = 0,
        y = 0,
    },
    config = {
        extra = {
            chips = 50
        }
    },
    pools = ["hdys_PanJoking"],
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