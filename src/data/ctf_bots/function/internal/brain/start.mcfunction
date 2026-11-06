# Round start, as a bot: its lure (ctf_bots:internal/brain/new_lure), its route (attack) or its
# defend spot (defense)
scoreboard players operation #me bots = @s bot.n
function ctf_bots:internal/brain/new_lure
tag @e[type=rabbit, tag=bot_mylure] remove bot_mylure
tag @s remove bot_guard
scoreboard players set @s bot.t 0
scoreboard players set @s bot.brk 0
execute if entity @s[tag=attack] run function ctf_bots:internal/brain/pick_route
execute if entity @s[tag=defense] run function ctf_bots:internal/brain/pick_spot
