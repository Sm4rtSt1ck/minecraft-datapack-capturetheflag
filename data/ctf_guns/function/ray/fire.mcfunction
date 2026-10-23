# Hitscan shot from the eyes of the shooter (tag gun.shooter), in the look direction + spread.
# #gun gun.tmp: 1 sniper (precise, 0.25 steps, red laser), 2 rifle (0.5 steps, thin yellow tracer)
# yaw, pitch - spread, degrees
execute unless data storage ctf_guns:config range run function ctf_guns:config
execute store result score #range gun.tmp run data get storage ctf_guns:config range
scoreboard players set #dist gun.tmp 0
scoreboard players set #pb gun.tmp 0
$execute if score #gun gun.tmp matches 1 anchored eyes positioned ^ ^ ^ rotated ~$(yaw) ~$(pitch) run function ctf_guns:ray/sniper_step
$execute if score #gun gun.tmp matches 2 anchored eyes positioned ^ ^ ^ rotated ~$(yaw) ~$(pitch) run function ctf_guns:ray/rifle_step
tag @a remove gun.hit
