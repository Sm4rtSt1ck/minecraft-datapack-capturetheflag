# One step of the bullet (0.25 blocks). Runs at the current point, rotated in the shot direction.
scoreboard players add #dist sn.tmp 1

# A solid block stops the bullet
execute unless block ~ ~ ~ #ctf_sniper:passable run return run function ctf_sniper:ray/hit_block

# A trap marker is hit -> the trap goes off
execute positioned ~ ~-0.25 ~ as @e[type=frog, tag=trap_marker, tag=!trap.detector, tag=!triggered, distance=..0.45, limit=1] run tag @s add sn.trap
execute if entity @e[type=frog, tag=sn.trap, limit=1] run return run function ctf_sniper:ray/hit_trap

# A player whose hitbox contains this point is hit (two 1-block boxes give an exact point test)
execute positioned ~-0.99 ~-0.99 ~-0.99 as @a[tag=player, tag=!sn.shooter, gamemode=!spectator, dx=0, dy=0, dz=0] positioned ~0.98 ~0.98 ~0.98 if entity @s[dx=0, dy=0, dz=0] run tag @s add sn.hit
execute if entity @a[tag=sn.hit, limit=1] run return run function ctf_sniper:ray/hit_player

# Max range
execute if score #dist sn.tmp >= #range sn.tmp run return 0

# Laser beam: a solid red line, with sparks every block
particle minecraft:dust{color:[1.0,0.05,0.05],scale:0.7} ~ ~ ~ 0 0 0 0 1 force @a[tag=!lobby]
scoreboard players operation #t sn.tmp = #dist sn.tmp
scoreboard players set #k sn.tmp 4
scoreboard players operation #t sn.tmp %= #k sn.tmp
execute if score #t sn.tmp matches 0 run particle minecraft:electric_spark ~ ~ ~ 0 0 0 0 1 force @a[tag=!lobby]

execute positioned ^ ^ ^0.25 run function ctf_sniper:ray/step
