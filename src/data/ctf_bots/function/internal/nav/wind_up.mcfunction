# As a bot at the foot of a wind charge link (its next node nav_next above): a wind charge under it
# (the gust, a charge spent) throws it up as high as the node + 1.5 (ctf_bots:internal/nav/wind_speed),
# then over onto it (bot_wup: ctf_bots:internal/nav/fall_tick)
execute store result score #y1 bots run data get entity @s Pos[1] 10
execute store result score #y2 bots run data get entity @n[type=marker, tag=nav_next] Pos[1] 10
scoreboard players operation #y2 bots -= #y1 bots
function ctf_bots:internal/nav/wind_speed
scoreboard players remove @s bot.wind 1
tag @s add bot_wup
tag @s add bot_fall
particle minecraft:gust_emitter_small ~ ~ ~ 0 0 0 0 1 force @a[tag=!lobby]
playsound minecraft:entity.wind_charge.wind_burst neutral @a[tag=!lobby] ~ ~ ~ 1 1
