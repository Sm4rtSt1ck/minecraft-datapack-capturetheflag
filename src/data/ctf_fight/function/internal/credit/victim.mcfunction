# Runs as a dead player (from ctf_fight:internal/die), when nobody got the vanilla kill credit
scoreboard players operation #by kc.tmp = @s kc.by
scoreboard players operation #src kc.tmp = @s kc.src
# The side of the victim (#vside kc.tmp: 1 attack, 2 defense): no reward for a teammate
scoreboard players set #vside kc.tmp 0
execute if entity @s[tag=attack] run scoreboard players set #vside kc.tmp 1
execute if entity @s[tag=defense] run scoreboard players set #vside kc.tmp 2
tag @s add kc.victim
execute as @a[tag=player] if score @s player_id = #by kc.tmp run function ctf_fight:internal/credit/award
# A bot's grenade / trap (BOTS.md)
execute as @e[type=zombified_piglin, tag=ctf_bot] if score @s player_id = #by kc.tmp run function ctf_fight:internal/credit/award
tag @s remove kc.victim
