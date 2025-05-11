scoreboard players remove freeze timer 1
execute store result bossbar ctf:match value run scoreboard players get freeze timer

execute if score freeze timer matches 199..200 run title @a[tag=player] title {"text": "10 SECS LEFT", "color": "green"}
execute if score freeze timer matches 60 as @a[tag=player] at @s run playsound minecraft:entity.experience_orb.pickup ambient @s ~ ~ ~ 10 0.4
execute if score freeze timer matches 60 run title @a[tag=player] title {"text": "3", "color": "green"}
execute if score freeze timer matches 60 as @a[tag=player] at @s run playsound minecraft:entity.experience_orb.pickup ambient @s ~ ~ ~ 10 0.6
execute if score freeze timer matches 40 run title @a[tag=player] title {"text": "2", "color": "green"}
execute if score freeze timer matches 40 as @a[tag=player] at @s run playsound minecraft:entity.experience_orb.pickup ambient @s ~ ~ ~ 10 0.8
execute if score freeze timer matches 20 run title @a[tag=player] title {"text": "1", "color": "green"}
execute if score freeze timer matches 20 as @a[tag=player] at @s run playsound minecraft:entity.experience_orb.pickup ambient @s ~ ~ ~ 10 1


execute at @e[type=tnt] run summon armor_stand ~ ~ ~ {Tags:["tnt_marker"], Marker:true}
kill @e[type=tnt]
execute at @e[type=armor_stand,tag=tnt_marker] run setblock ~ ~ ~ tnt
kill @e[type=armor_stand, tag=tnt_marker]

execute as @a[scores={flag_placed=1..}] run function ctf:match/event/place_flag
execute as @a[scores={just_died=1..}] run function ctf:match/event/die

function ctf:match/freeze/shop
execute if score freeze timer matches -2147483648..0 run function ctf:match/round/start
