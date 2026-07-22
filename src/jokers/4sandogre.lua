SMODS.Joker {
    key = "sandogre",
    atlas = "placeholders",
    pos = {
        x = 3,
        y = 0
    },

    discovered = true,
    unique = true,
    rarity = 1,
    cost = 3,

    config = {
        extra = {
            increment = 3,
            cnt = 0
        }
    },

    eternal_compat = false,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand:change_size(-(card.ability.extra.increment * card.ability.extra.cnt))
                    card.ability.extra.cnt = 0
                    return true
                end
            }))

            return {
                message = "Reset",
                card = card,
            }
        elseif context.press_play and not context.blind_defeated or context.pre_discard then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand:change_size(card.ability.extra.increment)
                    card.ability.extra.cnt = card.ability.extra.cnt + 1
                    return true
                end
            }))

            return {
                message = "+" .. card.ability.extra.increment .. " Hand Size",
                card = card,
            }
        end

        
    end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.increment     
            }
        }
    end,
}