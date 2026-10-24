# Every victim to his own death location (several players can die in the same tick)
execute as @a[tag=just_died] run function ctf:match/events/fight/tp_own_death_location

execute positioned as @a[tag=just_died] run particle scrape ~ ~1 ~ 0.1 0.1 0.1 1 50 normal @a[tag=!just_died]
execute as @a[tag=just_died] positioned as @s run playsound minecraft:entity.allay.death ambient @s ~ ~ ~ 2 0

# Default items dropped on death (leather armor, golden sword: #ctf:death_cleanup) are removed
execute as @e[type=item] if items entity @s contents #ctf:death_cleanup run kill @s

execute as @a[tag=just_died, tag=ultimate] run function ctf:match/events/ultimate/end

# Death camera: 3.5 seconds from the eyes of an enderman, looking at the killer
execute as @a[tag=just_died, gamemode=spectator] at @s run function ctf:match/events/fight/deathcam/start


tag @a[tag=just_died] remove just_died
