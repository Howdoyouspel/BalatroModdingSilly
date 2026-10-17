SMODS.ObjectType({
    key = "Terrarian",
    default = "j_joker",
    cards = {},
    inject = function(self)
        SMODS.OjbectType.inject(self)
        self:inject_card(G.P_CENTERS.j_vagabond)
        self:inject_card(G.P_CENTERS.j_even_steven) -- HAI STEVEN
        self:inject_card(G.P_CENTERS.j_square) -- its all because of square of course!!!

})