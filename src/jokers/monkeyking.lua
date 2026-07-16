SMODS.Joker {
    key = 'monkeyking',
    atlas = 'placeholders',
    pos = {
        x = 0,
        y = 0
    },
    discovered = true,
    rarity = 4,
    soul_pos = nil,
    cost = 500,
    config = {
        extra = {
            amt = 1,
        }
    },

    eternal_compat = false,
    calculate = function(self, card, context)
        if context.ending_shop and context.main_eval then
            G.E_MANAGER:add_event(Event({
                func = function()
                    for i = 1, card.ability.extra.amt do
                        SMODS.add_card({
                            key = "j_cavendish",
                            edition = {negative = true}
                        })
                    end
                    if card.ability.extra.amt < 4 then
                        card.ability.extra.amt = card.ability.extra.amt + 1
                    end
                    return true
                end
        }))
        end
    end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.amt,
            }
        }
    end
}