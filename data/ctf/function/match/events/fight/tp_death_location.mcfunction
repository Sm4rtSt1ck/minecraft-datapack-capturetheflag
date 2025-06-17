summon armor_stand -190 0 -190 {Invisible:1b,Marker:1b,Tags:["lastDeathMarker"]}
execute store result entity @n[tag=lastDeathMarker] Pos[0] double 1 run data get entity @n[tag=just_died] LastDeathLocation.pos[0]
execute store result entity @n[tag=lastDeathMarker] Pos[1] double 1 run data get entity @n[tag=just_died] LastDeathLocation.pos[1]
execute store result entity @n[tag=lastDeathMarker] Pos[2] double 1 run data get entity @n[tag=just_died] LastDeathLocation.pos[2]
tp @n[tag=just_died] @n[tag=lastDeathMarker]
kill @n[tag=lastDeathMarker]

execute positioned as @n[tag=just_died] run particle scrape ~ ~1 ~ 0.1 0.1 0.1 1 50 normal @a[tag=!just_died]
execute as @n[tag=just_died] positioned as @s run playsound minecraft:entity.allay.death ambient @s ~ ~ ~ 2 0
# effect give @r[tag=just_died] blindness 3 1 true
# execute if entity @a[tag=just_killed] run title @r[tag=just_died] subtitle [{"selector": "@r[tag=just_killed]"}, {"text": " has ", "color": "gold"}, {"score": {"name": "@r[tag=just_killed]", "objective": "health"}, "color": "red"}, {"text": " hp left!", "color": "gold"}]

# spectate @r[tag=just_killed] @r[tag=just_died]

kill @e[type=item, nbt={Item:{id:"minecraft:leather_helmet"}}]
kill @e[type=item, nbt={Item:{id:"minecraft:leather_chestplate"}}]
kill @e[type=item, nbt={Item:{id:"minecraft:leather_leggings"}}]
kill @e[type=item, nbt={Item:{id:"minecraft:leather_boots"}}]
# kill @e[type=item, nbt={Item:{id:"minecraft:golden_sword"}}]


tag @n[tag=just_died] remove just_died
