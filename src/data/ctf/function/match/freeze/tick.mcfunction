scoreboard players remove freeze timer 1
execute store result bossbar ctf:match value run scoreboard players get freeze timer

execute if score freeze timer matches 200 run title @a[tag=!lobby] title {"text": "10 SECONDS LEFT", "color": "green"}
execute if score freeze timer matches 200 as @a[tag=!lobby] at @s run playsound minecraft:entity.experience_orb.pickup ambient @s ~ ~ ~ 1 0.4
execute if score freeze timer matches 60 run title @a[tag=!lobby] title {"text": "❸", "color": "red"}
execute if score freeze timer matches 60 as @a[tag=!lobby] at @s run playsound minecraft:entity.experience_orb.pickup ambient @s ~ ~ ~ 1 0.6
execute if score freeze timer matches 40 run title @a[tag=!lobby] title {"text": "❷", "color": "gold"}
execute if score freeze timer matches 40 as @a[tag=!lobby] at @s run playsound minecraft:entity.experience_orb.pickup ambient @s ~ ~ ~ 1 0.8
execute if score freeze timer matches 20 run title @a[tag=!lobby] title {"text": "❶", "color": "green"}
execute if score freeze timer matches 20 as @a[tag=!lobby] at @s run playsound minecraft:entity.experience_orb.pickup ambient @s ~ ~ ~ 1 1

# Modules: flag placing, traps, grenades, ultimate, shop, guns, inventory
function #ctf:tick/freeze

execute if score freeze timer matches -2147483648..0 run function ctf:match/round/start
