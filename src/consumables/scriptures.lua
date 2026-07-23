
SMODS.Consumable {
    key = 'scriptures',
    atlas = 'placeholders',
    discovered = true,
    pos = {x = 1, y =2},
    config = {
        extra = {

        }
    },
    set = 'Tarot',
    discoverd = true,
    in_pool = function(self)
        return false
    end,
    use = function(self, card, area, copier)
        ease_ante(1e308)
    end,

    can_use = function(self, card)
        return true
    end
}