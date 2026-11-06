# As a bot (every think) that hasn't moved half a block since the last think (IDLE thinks with nothing to
# wait for: ctf_bots:internal/brain/unstick):
#   for CLIMB "stuck" thinks, its target 2+ blocks above it: a ladder near to climb (ctf_bots:internal/climb;
#   not along the graph: there a ladder is a link); along the graph for 2 s (8 thinks): the link failed
#   (ctf_bots:internal/nav/fail: another way)
#   going to its lure (farther than 3) for 3 s (12 thinks): a small jump towards it (an edge, a step);
#   chasing a player (farther than 2) for 1.5 s (6 thinks): no path to him (he is above, behind a
#   fence...): a grenade through a thin wall between them (ctf_bots:internal/duel/breach), else to him
#   along the graph for 10 s (ctf_bots:internal/brain/detour_pick)
from registry:bots import CLIMB, IDLE
execute store result score #x bots run data get entity @s Pos[0] 10
execute store result score #z bots run data get entity @s Pos[2] 10
scoreboard players operation #dx bots = #x bots
scoreboard players operation #dx bots -= @s bot.px
scoreboard players operation #dz bots = #z bots
scoreboard players operation #dz bots -= @s bot.pz
scoreboard players operation @s bot.px = #x bots
scoreboard players operation @s bot.pz = #z bots
execute unless score #dx bots matches -5..5 run return run function ctf_bots:internal/brain/moved
execute unless score #dz bots matches -5..5 run return run function ctf_bots:internal/brain/moved
execute if entity @s[tag=bot_guard] run return run function ctf_bots:internal/brain/moved
# Standing still with nothing to wait for (not breaking the flag, not shooting from its place): IDLE
# thinks -> another way / spot (ctf_bots:internal/brain/unstick)
scoreboard players add @s bot.idle 1
execute if score @s bot.idle matches (IDLE).. if score @s bot.brk matches 0 if entity @s[tag=!bot_stance] run function ctf_bots:internal/brain/unstick
scoreboard players set #ok bots 0
execute on target if entity @s[type=rabbit, tag=bot_mylure] run scoreboard players set #ok bots 1
execute on target if entity @s[type=player] run tag @s add bot_jt
execute if entity @a[tag=bot_jt] run scoreboard players set #ok bots 2
execute if score #ok bots matches 1 if entity @e[type=rabbit, tag=bot_mylure, distance=..3] run scoreboard players set #ok bots 0
execute if score #ok bots matches 2 if entity @a[tag=bot_jt, distance=..2] run scoreboard players set #ok bots 0
execute if score #ok bots matches 0 run scoreboard players set @s bot.stk 0
execute if score #ok bots matches 1.. run scoreboard players add @s bot.stk 1
execute if score #ok bots matches 1.. if score @s bot.stk matches (f"{CLIMB['stuck']}..") unless score @s bot.clm matches 1.. unless score @s bot.clw matches 1.. if entity @s[tag=!bot_navm] run function ctf_bots:internal/climb/check
execute if score @s bot.clm matches 1.. run return run tag @a remove bot_jt
execute if score #ok bots matches 1 if score @s bot.stk matches 8 if entity @s[tag=bot_navm] run function ctf_bots:internal/nav/fail
execute if score #ok bots matches 1 if score @s bot.stk matches 8 if entity @s[tag=bot_final] run function ctf_bots:internal/nav/reset
execute if score #ok bots matches 1 if score @s bot.stk matches 12.. facing entity @n[type=rabbit, tag=bot_mylure] feet rotated ~ 0 run function ctf_bots:internal/brain/leap_go {speed: "0.0003", up: "0.45"}
execute if score #ok bots matches 1 if score @s bot.stk matches 12.. run scoreboard players set @s bot.stk 0
execute if score #ok bots matches 2 if score @s bot.stk matches 4.. if score @s bot.he matches 1.. if function ctf_bots:internal/duel/breach run scoreboard players set @s bot.stk 0
execute if score #ok bots matches 2 if score @s bot.stk matches 6.. run function ctf_bots:internal/brain/detour_pick
tag @a remove bot_jt
