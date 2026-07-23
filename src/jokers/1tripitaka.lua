SMODS.Joker {
    key = 'tripitaka',
    atlas = 'placeholders',
    pos = {
        x = 2,
        y = 0
    },
    discovered = true,
    unique = true,
    rarity = 1,
    cost = 3,
    config = {
        extra = {
            cnt = 0,
            spawned = false,
            hands = 3
        }   
    },

    eternal_compat = false,

    calculate = function(self, card, context)
        if (context.after and context.main_eval and not context.blueprint) or (context.discard and context.main_eval and not context.blueprint) or 
        context.open_booster or context.buying_card or context.selling_card or context.using_consumeable or context.reroll_shop then
             G.E_MANAGER:add_event(Event({
                func = function()
                    card.ability.extra.cnt = card.ability.extra.cnt + 1
                    return true
                end,
             }))
        end
 
        if card.ability.extra.cnt == 300 and card.ability.extra.spawned == false then
            G.E_MANAGER:add_event(Event({
                func = function()
                    card.ability.extra.spawned = true
                    SMODS.add_card({
                        key = "c_qwektm_goldenstaff",
                        edition = {negative = true}
                })
                return true
            end
             }))
            
        end

    end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cnt,
                card.ability.extra.hands
            }
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
        ease_hands_played(card.ability.extra.hands)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
        ease_hands_played(-card.ability.extra.hands)
    end
}