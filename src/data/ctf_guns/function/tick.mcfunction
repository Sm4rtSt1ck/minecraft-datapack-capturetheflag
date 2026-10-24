# Run once per tick in freeze / round / end_round
# Settings are loaded at match start; load them now if they are missing (or outdated)
execute unless data storage ctf_guns:config rifle_rate run function ctf_guns:config
# Rifle fire rate: every shot adds 20 to rf.cd, every tick removes rifle_rate,
# a shot is possible at rf.cd <= 0. The remainder is kept, so the rate is exact (6 -> 3-3-4 ticks)
execute store result score #rate gun.tmp run data get storage ctf_guns:config rifle_rate
scoreboard players operation @a[scores={rf.cd=1..}] rf.cd -= #rate gun.tmp

# The burst spread is reset ~2 ticks after the trigger was released
scoreboard players remove @a[scores={rf.hold=1..}] rf.hold 1
scoreboard players set @a[scores={rf.hold=0, rf.spray=1..}] rf.spray 0
# No "saved up" shots after a pause
scoreboard players set @a[scores={rf.hold=0, rf.cd=..-1}] rf.cd 0

execute as @a[scores={rf.reload=1..}] at @s run function ctf_guns:rifle/reload_tick
execute as @a[tag=player, gamemode=!spectator] if items entity @s weapon.mainhand *[custom_data~{wpn:"rifle"}] unless score @s rf.reload matches 1.. run function ctf_guns:rifle/hud
