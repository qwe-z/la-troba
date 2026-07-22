SMODS.Joker {
	key = 'monkpig',
    atlas = 'placeholders',
    pos = {
        x = 2,
        y = 0
    },
    discovered = true,
    unique = true,
    rarity = 3,
    cost = 3,
    config = {
        extra = {
            reps = 3
        }   
    },
    
    food_jokers = { j_gros_michel = true, j_cavendish = true, j_popcorn = true, 
            j_ice_cream = true, j_ramen = true, j_diet_cola = true, j_seltzer = true,
    },

    eternal_compat = false,

    calculate = function(self, card, context)
        if context.retrigger_joker_check 
        and not context.retrigger_joker
        and context.other_card.ability
        and card.config.center.food_jokers[context.other_card.config.center_key] then
            return {
                repetitions = card.ability.extra.reps,
                message = "Again!",
                card = card,
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.reps
            }
        }
    end,
}