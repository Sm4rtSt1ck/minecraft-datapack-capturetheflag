# The shooter sets the trap off, so he gets the kill credit (ctf:match/events/credit)
particle minecraft:crit ~ ~ ~ 0.1 0.1 0.1 0.2 10 force @a[tag=!lobby]
scoreboard players operation @e[type=frog, tag=gun.trap] kc.owner = @a[tag=gun.shooter, limit=1] player_id
execute as @e[type=frog, tag=gun.trap] at @s run function ctf_guns:ray/trigger_trap
tag @e[tag=gun.trap] remove gun.trap
