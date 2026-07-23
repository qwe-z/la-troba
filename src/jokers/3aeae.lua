SMODS.Joker {
    key = "aeae",
    atlas = "placeholders",
    pos = {
        x = 1,
        y = 0
    },

    discovered = true,
    rarity = 3,
    cost = 5,

    config = {
        extra = {
            emult = 3
        }
    },

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                emult = card.ability.extra.emult
            }
        end
        if context.end_of_round and context.main_eval then
            G.E_MANAGER:add_event(Event({
					func = function()
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true
							end,
						}))
						return true
					end,
				}))
            return {
					message = localize("k_eaten_ex"),
					colour = G.C.FILTER,
				}
        end
    end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.emult
            }
        }
    end,

    
}