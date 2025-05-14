# tp @r[tag=just_died] @r[tag=just_killed]

# say I've died

execute at @r[tag=just_died] run summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,Tags:["lastDeathMarker"]}
execute store result entity @n[tag=lastDeathMarker] Pos[0] double 1 run data get entity @r[tag=just_died] LastDeathLocation.pos[0]
execute store result entity @n[tag=lastDeathMarker] Pos[1] double 1 run data get entity @r[tag=just_died] LastDeathLocation.pos[1]
execute store result entity @n[tag=lastDeathMarker] Pos[2] double 1 run data get entity @r[tag=just_died] LastDeathLocation.pos[2]
tp @r[tag=just_died] @n[tag=lastDeathMarker]
kill @n[tag=lastDeathMarker]

execute as @r[tag=just_died] positioned as @s run playsound minecraft:entity.allay.death ambient @s ~ ~ ~ 2 0
effect give @r[tag=just_died] blindness 3 1 true

tag @r[tag=just_died] remove just_died
tag @r[tag=just_killed] remove just_killed
