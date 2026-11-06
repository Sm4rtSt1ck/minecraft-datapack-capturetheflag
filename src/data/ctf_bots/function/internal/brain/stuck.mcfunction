# As a bot (every think) that hasn't moved half a block since the last think:
#   going to its lure (farther than 3) for 3 s (12 thinks): a small jump towards it (an edge, a step);
#   chasing a player (farther than 2) for 1.5 s (6 thinks): no path to him (he is above, behind a
#   fence...): a detour by the bot marker nearest to him (ctf_bots:internal/brain/detour_pick)
execute store result score #x bots run data get entity @s Pos[0] 10
execute store result score #z bots run data get entity @s Pos[2] 10
scoreboard players operation #dx bots = #x bots
scoreboard players operation #dx bots -= @s bot.px
scoreboard players operation #dz bots = #z bots
scoreboard players operation #dz bots -= @s bot.pz
scoreboard players operation @s bot.px = #x bots
scoreboard players operation @s bot.pz = #z bots
execute unless score #dx bots matches -5..5 run return run scoreboard players set @s bot.stk 0
execute unless score #dz bots matches -5..5 run return run scoreboard players set @s bot.stk 0
execute if entity @s[tag=bot_guard] run return run scoreboard players set @s bot.stk 0
scoreboard players set #ok bots 0
execute on target if entity @s[type=rabbit, tag=bot_mylure] run scoreboard players set #ok bots 1
execute on target if entity @s[type=player] run tag @s add bot_jt
execute if entity @a[tag=bot_jt] run scoreboard players set #ok bots 2
execute if score #ok bots matches 1 if entity @e[type=rabbit, tag=bot_mylure, distance=..3] run scoreboard players set #ok bots 0
execute if score #ok bots matches 2 if entity @a[tag=bot_jt, distance=..2] run scoreboard players set #ok bots 0
execute if score #ok bots matches 0 run scoreboard players set @s bot.stk 0
execute if score #ok bots matches 1.. run scoreboard players add @s bot.stk 1
execute if score #ok bots matches 1 if score @s bot.stk matches 12.. facing entity @n[type=rabbit, tag=bot_mylure] feet rotated ~ 0 run function ctf_bots:internal/brain/leap_go {speed: "0.0003", up: "0.45"}
execute if score #ok bots matches 1 if score @s bot.stk matches 12.. run scoreboard players set @s bot.stk 0
execute if score #ok bots matches 2 if score @s bot.stk matches 6.. run function ctf_bots:internal/brain/detour_pick
tag @a remove bot_jt
