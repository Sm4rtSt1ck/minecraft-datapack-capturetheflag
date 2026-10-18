# The shooter sets the trap off, so he gets the kill credit (ctf:match/events/credit)
particle minecraft:crit ~ ~ ~ 0.1 0.1 0.1 0.2 10 force @a[tag=!lobby]
scoreboard players operation @e[type=frog, tag=sn.trap] kc.owner = @a[tag=sn.shooter, limit=1] player_id
execute as @e[type=frog, tag=sn.trap] at @s run function ctf_sniper:ray/trigger_trap
tag @e[tag=sn.trap] remove sn.trap
