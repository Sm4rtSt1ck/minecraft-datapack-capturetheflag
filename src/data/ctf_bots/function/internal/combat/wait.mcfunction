# As a bot that must wait (bot.rdy ticks, ctf_bots:internal/combat/wait_tick): it doesn't shoot, and its
# melee hits deal no damage (a mob swings anyway: a miss)
execute if entity @s[tag=bot_wait] run return 0
tag @s add bot_wait
attribute @s minecraft:attack_damage modifier add ctf_bots:wait -1 add_multiplied_total
