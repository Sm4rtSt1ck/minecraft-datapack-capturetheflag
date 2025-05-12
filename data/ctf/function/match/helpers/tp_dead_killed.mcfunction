tp @r[tag=just_died] @r[tag=just_killed]

execute as @r[tag=just_died] positioned as @s run playsound minecraft:entity.allay.death ambient @s ~ ~ ~ 2 0
effect give @r[tag=just_died] blindness 3 1 true

tag @r[tag=just_died] remove just_died
tag @r[tag=just_killed] remove just_killed
