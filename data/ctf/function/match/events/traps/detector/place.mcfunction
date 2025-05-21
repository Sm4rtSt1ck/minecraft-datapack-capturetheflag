execute positioned as @s run summon armor_stand ~ ~ ~ {Marker: true, Invisible: true, Tags: [trap, trap_display, trap.detector], ArmorItems:[{}, {}, {}, {id:"minecraft:ender_eye"}]}

execute as @n[tag=!placed, tag=trap_display] at @s run tp @s ~ ~-1.4 ~
execute as @n[tag=!placed, tag=trap_display] at @s if entity @n[tag=placed, tag=trap_display, distance=..0.1] run tp @s ~ ~1 ~
execute as @n[tag=!placed, tag=trap_display] at @s if entity @n[tag=placed, tag=trap_display, distance=..0.1] run tp @s ~ ~1 ~

execute positioned as @n[tag=!placed, tag=trap_display] run summon frog ~ ~1.4 ~ {Health: 1, Silent: true, NoAI:true, active_effects:[{id:"minecraft:invisibility", duration:9999999,show_particles:false}], Tags: ["trap", "trap_marker", "trap.detector"]}

execute positioned as @s run tag @n[tag=!placed, tag=trap_display] add placed

scoreboard players set @s carrot_on_stick 0
clear @s *[custom_data={tags: ["trap", "detector"]}] 1
