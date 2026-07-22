SMODS.Consumable {
    key = 'goldenstaff',
    atlas = 'placeholders',
    discovered = true,
    pos = {x = 2, y =2},
    config = {
        extra = {

        }
    },
    set = 'Spectral',
    discoverd = true,
    in_pool = function(self)
        return false
    end,
    use = function(self, card, area, copier)
        SMODS.add_card({
            key = "j_qwektm_monkeyking",
        })
    end,

    can_use = function(self, card)
        return true
    end
}