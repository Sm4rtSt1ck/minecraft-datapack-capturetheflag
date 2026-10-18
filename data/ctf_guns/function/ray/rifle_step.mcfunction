# One step of the rifle bullet (0.5 blocks; #dist counts half blocks). Cheaper than the sniper:
# twice as long steps, so the hitbox test has a 0.25 block tolerance instead of an exact point
scoreboard players add #dist gun.tmp 1
execute unless block ~ ~ ~ #ctf_guns:passable run return run function ctf_guns:ray/hit_block

execute positioned ~ ~-0.25 ~ as @e[type=frog, tag=trap_marker, tag=!trap.detector, tag=!triggered, distance=..0.6, limit=1] run tag @s add gun.trap
execute if entity @e[type=frog, tag=gun.trap, limit=1] run return run function ctf_guns:ray/hit_trap

execute positioned ~-0.75 ~-0.75 ~-0.75 as @a[tag=player, tag=!gun.shooter, gamemode=!spectator, dx=0, dy=0, dz=0] positioned ~0.5 ~0.5 ~0.5 if entity @s[dx=0, dy=0, dz=0] run tag @s add gun.hit
execute if entity @a[tag=gun.hit, limit=1] run return run function ctf_guns:ray/hit_player

scoreboard players operation #t gun.tmp = #dist gun.tmp
scoreboard players set #k gun.tmp 2
scoreboard players operation #t gun.tmp /= #k gun.tmp
execute if score #t gun.tmp >= #range gun.tmp run return 0

# Thin yellow tracer
particle minecraft:dust{color:[1.0,0.85,0.25],scale:0.3} ~ ~ ~ 0 0 0 0 1 force @a[tag=!lobby]

execute positioned ^ ^ ^0.5 run function ctf_guns:ray/rifle_step
