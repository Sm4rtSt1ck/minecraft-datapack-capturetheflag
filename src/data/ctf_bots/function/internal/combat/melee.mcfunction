# As a bot without a target at range: its main weapon in the hand, no shooting
execute if score @s bot.hold matches 1 run function ctf_bots:internal/combat/hold_melee
tag @s remove bot_shoot
