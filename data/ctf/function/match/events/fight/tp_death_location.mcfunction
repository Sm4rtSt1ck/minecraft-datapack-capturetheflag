# Every victim to his own death location (several players can die in the same tick)
execute as @a[tag=just_died] run function ctf:match/events/fight/tp_own_death_location

execute positioned as @a[tag=just_died] run particle scrape ~ ~1 ~ 0.1 0.1 0.1 1 50 normal @a[tag=!just_died]
execute as @a[tag=just_died] positioned as @s run playsound minecraft:entity.allay.death ambient @s ~ ~ ~ 2 0
# effect give @r[tag=just_died] blindness 3 1 true
# execute if entity @a[tag=just_killed] run title @r[tag=just_died] subtitle [{"selector": "@r[tag=just_killed]"}, {"text": " has ", "color": "gold"}, {"score": {"name": "@r[tag=just_killed]", "objective": "health"}, "color": "red"}, {"text": " hp left!", "color": "gold"}]

# spectate @r[tag=just_killed] @r[tag=just_died]

kill @e[type=item, nbt={Item:{id:"minecraft:leather_helmet"}}]
kill @e[type=item, nbt={Item:{id:"minecraft:leather_chestplate"}}]
kill @e[type=item, nbt={Item:{id:"minecraft:leather_leggings"}}]
kill @e[type=item, nbt={Item:{id:"minecraft:leather_boots"}}]
kill @e[type=item, nbt={Item:{id:"minecraft:golden_sword"}}]
# kill @e[type=item, nbt={Item:{id:"minecraft:golden_sword"}}]

execute as @a[tag=just_died, tag=ultimate] run function ctf:match/events/ultimate/end

# Death camera: 3.5 seconds from the eyes of an enderman, looking at the killer
execute as @a[tag=just_died, gamemode=spectator] at @s run function ctf:match/events/fight/deathcam/start


tag @a[tag=just_died] remove just_died
