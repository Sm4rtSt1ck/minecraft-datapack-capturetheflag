scoreboard players remove warmup timer 1
execute store result bossbar ctf:match value run scoreboard players get warmup timer

execute if score warmup timer matches 60 run title @a[tag=player] title {"text":"❸", "color":"green"}
execute if score warmup timer matches 60 as @a[tag=!lobby] at @s run playsound entity.experience_orb.pickup ambient @s ~ ~ ~ 1 0.6
execute if score warmup timer matches 40 run title @a[tag=player] title {"text":"❷", "color":"green"}
execute if score warmup timer matches 40 as @a[tag=!lobby] at @s run playsound entity.experience_orb.pickup ambient @s ~ ~ ~ 1 0.8
execute if score warmup timer matches 20 run title @a[tag=player] title {"text":"❶", "color":"green"}
execute if score warmup timer matches 20 as @a[tag=!lobby] at @s run playsound entity.experience_orb.pickup ambient @s ~ ~ ~ 1 1

execute as @a[scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[minecraft:custom_data={action:"skip"}] run tag @s add skip

execute unless entity @a[tag=player, tag=!skip] run function ctf:match/warmup/skip

execute if score warmup timer matches -2147483648..0 run function ctf:match/warmup/end
