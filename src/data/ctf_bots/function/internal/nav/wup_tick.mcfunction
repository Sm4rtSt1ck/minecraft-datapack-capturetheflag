# As a bot thrown up by its wind charge: risen above its lure (the next node): over onto it (once)
execute store result score #y1 bots run data get entity @s Pos[1] 10
scoreboard players operation #me2 bots = @s bot.n
execute as @e[type=rabbit, tag=bot_lure] if score @s bot.own = #me2 bots run tag @s add bot_wl
execute store result score #y2 bots run data get entity @n[type=rabbit, tag=bot_wl] Pos[1] 10
scoreboard players add #y2 bots 3
execute if score #y1 bots >= #y2 bots run function ctf_bots:internal/nav/wup_over
tag @e[type=rabbit, tag=bot_wl] remove bot_wl
