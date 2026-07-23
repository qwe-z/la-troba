SMODS.Joker {
    key = "a",
    atlas = "placeholders",
    pos = {
        x = 0,
        y = 0
    },

    discovered = true,
    rarity = 1,
    cost = 5,

    config = {
        extra = {
            emult = 2
        }
    },

    blueprint_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.emult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                emult = card.ability.extra.emult
            }
        end
    end,
}