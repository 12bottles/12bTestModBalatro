SMODS.Joker {
    key = 'joker4',
    atlas = 'placeholders',
    pos = {
        x = 2,
        y = 0
    },
    rarity = 3,
    cost = 7,
    calculate = function(self, card, context)
        if context.create_shop_booster then
            context.booster.cost = 0
        end
    end
}