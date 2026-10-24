scoreboard players remove warmup timer 1
execute store result bossbar ctf:match value run scoreboard players get warmup timer

execute if score warmup timer matches 60 run title @a[tag=!lobby] title {"text":"❸", "color":"red"}
execute if score warmup timer matches 60 as @a[tag=!lobby] at @s run playsound entity.experience_orb.pickup ambient @s ~ ~ ~ 1 0.6
execute if score warmup timer matches 40 run title @a[tag=!lobby] title {"text":"❷", "color":"gold"}
execute if score warmup timer matches 40 as @a[tag=!lobby] at @s run playsound entity.experience_orb.pickup ambient @s ~ ~ ~ 1 0.8
execute if score warmup timer matches 20 run title @a[tag=!lobby] title {"text":"❶", "color":"green"}
execute if score warmup timer matches 20 as @a[tag=!lobby] at @s run playsound entity.experience_orb.pickup ambient @s ~ ~ ~ 1 1

# Skip vote: once per player; the warm-up is skipped when 2/3 of the players voted
execute as @a[tag=!skip, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[minecraft:custom_data={action:"skip"}] run function ctf:match/warmup/vote

# Votes are counted again only on a vote (ctf:match/warmup/vote) or when the number of players changes
execute store result score #now skip.tmp if entity @a[tag=player]
execute unless score #now skip.tmp = #all skip.tmp run function ctf:match/warmup/count_votes

execute if score warmup timer matches -2147483648..0 run function ctf:match/warmup/end
