# One step of the sniper bullet (0.25 blocks; #dist counts quarter blocks)
scoreboard players add #dist gun.tmp 1
# Thin shapes (doors, trapdoors, gates, fences): a 3/16 plate may lie between two steps, so next to
# a non-passable block the way from the last step is checked every 1/8 block (ray/fine_sniper)
execute store success score #nb gun.tmp unless block ~ ~ ~ #ctf_guns:passable
scoreboard players set #fh gun.tmp 0
execute if score #nb gun.tmp matches 1 run function ctf_guns:ray/fine_sniper
execute if score #nb gun.tmp matches 0 if score #pb gun.tmp matches 1 run function ctf_guns:ray/fine_sniper
scoreboard players operation #pb gun.tmp = #nb gun.tmp
execute if score #fh gun.tmp matches 1 run return 0
execute if score #nb gun.tmp matches 1 if function ctf_guns:ray/solid run return run function ctf_guns:ray/hit_block

# Invisible walls (loot crate reward) stop the bullet too
execute positioned ~-0.99 ~-0.99 ~-0.99 as @e[type=armor_stand, tag=ctf.wall, dx=0, dy=0, dz=0] positioned ~0.98 ~0.98 ~0.98 if entity @s[dx=0, dy=0, dz=0] run tag @s add gun.wall
execute if entity @e[type=armor_stand, tag=gun.wall, limit=1] run return run function ctf_guns:ray/hit_wall


# A trap marker is hit -> the trap goes off
execute positioned ~ ~-0.25 ~ as @e[type=frog, tag=trap_marker, tag=!trap.detector, tag=!triggered, distance=..0.45, limit=1] run tag @s add gun.trap
execute if entity @e[type=frog, tag=gun.trap, limit=1] run return run function ctf_guns:ray/hit_trap

# A player whose hitbox contains this point (two 1-block boxes give an exact point test)
execute positioned ~-0.99 ~-0.99 ~-0.99 as @a[tag=player, tag=!gun.shooter, gamemode=!spectator, dx=0, dy=0, dz=0] positioned ~0.98 ~0.98 ~0.98 if entity @s[dx=0, dy=0, dz=0] run tag @s add gun.hit
execute if entity @a[tag=gun.hit, limit=1] run return run function ctf_guns:ray/hit_player
# Creepers (Creepenator: a player is in it) the same way
execute positioned ~-0.99 ~-0.99 ~-0.99 as @e[type=creeper, dx=0, dy=0, dz=0] positioned ~0.98 ~0.98 ~0.98 if entity @s[dx=0, dy=0, dz=0] run tag @s add gun.hit_c
execute if entity @e[type=creeper, tag=gun.hit_c, limit=1] run return run function ctf_guns:ray/hit_creeper

# Max range (range is in blocks, 4 steps per block)
scoreboard players operation #t gun.tmp = #dist gun.tmp
scoreboard players set #k gun.tmp 4
scoreboard players operation #t gun.tmp /= #k gun.tmp
execute if score #t gun.tmp >= #range gun.tmp run return 0

# Laser beam: a solid red line, with sparks every block
particle minecraft:dust{color:[1.0,0.05,0.05],scale:0.7} ~ ~ ~ 0 0 0 0 1 force @a[tag=!lobby]
scoreboard players operation #t gun.tmp = #dist gun.tmp
scoreboard players operation #t gun.tmp %= #k gun.tmp
execute if score #t gun.tmp matches 0 run particle minecraft:electric_spark ~ ~ ~ 0 0 0 0 1 force @a[tag=!lobby]

execute positioned ^ ^ ^0.25 run function ctf_guns:ray/sniper_step
