# An attack bot next to the placed flag: it stays at the flag and breaks it in 3 seconds (12 thinks)
scoreboard players add @s bot.brk 1
execute at @n[type=armor_stand, tag=flag] run particle minecraft:block{block_state: "minecraft:magenta_banner"} ~ ~0.5 ~ 0.2 0.3 0.2 0 6 normal @a[tag=!lobby]
execute at @n[type=armor_stand, tag=flag] run playsound minecraft:block.wool.hit block @a[tag=!lobby] ~ ~ ~ 1 1
execute if score @s bot.brk matches 12.. at @n[type=armor_stand, tag=flag] run setblock ~ ~ ~ air
execute if score @s bot.brk matches 12.. run scoreboard players set @s bot.brk 0
execute at @n[type=armor_stand, tag=flag] run function ctf_bots:internal/brain/lure_here
