scoreboard players remove warmup timer 1
execute store result bossbar ctf:match value run scoreboard players get warmup timer

execute if score warmup timer matches 60 run title @a[tag=player] title {"text":"3", "color":"green"}
execute if score warmup timer matches 60 as @a[tag=!lobby] at @s run playsound entity.experience_orb.pickup ambient @s ~ ~ ~ 1 0.6
execute if score warmup timer matches 40 run title @a[tag=player] title {"text":"2", "color":"green"}
execute if score warmup timer matches 40 as @a[tag=!lobby] at @s run playsound entity.experience_orb.pickup ambient @s ~ ~ ~ 1 0.8
execute if score warmup timer matches 20 run title @a[tag=player] title {"text":"1", "color":"green"}
execute if score warmup timer matches 20 as @a[tag=!lobby] at @s run playsound entity.experience_orb.pickup ambient @s ~ ~ ~ 1 1

execute if score warmup timer matches -2147483648..0 run function ctf:match/warmup/end
