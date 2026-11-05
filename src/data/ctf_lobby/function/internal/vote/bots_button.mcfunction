# ctf_lobby:internal/vote/tick, as a lobby player: the bots button (slot 9) is given when it is
# missing; it glints when the bots are on. A click: ctf_lobby:internal/vote/bots_toggle
execute unless items entity @s hotbar.8 *[custom_data~{action: "bots"}] run clear @s carrot_on_a_stick[custom_data~{action: "bots"}]
execute unless items entity @s hotbar.8 *[custom_data~{action: "bots"}] run function ctf_lobby:internal/vote/bots_give
execute if score @s carrot_on_stick matches 1.. if items entity @s weapon.mainhand *[custom_data~{action: "bots"}] run function ctf_lobby:internal/vote/bots_toggle
