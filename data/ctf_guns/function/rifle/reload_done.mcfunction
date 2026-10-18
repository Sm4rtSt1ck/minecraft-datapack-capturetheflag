# Moves up to one magazine of rounds from the reserve into the magazine
scoreboard players reset @s rf.reload
function ctf_guns:rifle/reserve
execute store result score #m gun.tmp run data get storage ctf_guns:config rifle_mag
execute if score #n inv.tmp < #m gun.tmp run scoreboard players operation #m gun.tmp = #n inv.tmp
execute if score #m gun.tmp matches ..0 run return run function ctf_guns:rifle/no_ammo
execute store result storage ctf_guns:tmp reload.count int 1 run scoreboard players get #m gun.tmp
function ctf_guns:rifle/take with storage ctf_guns:tmp reload
scoreboard players operation @s rf.mag = #m gun.tmp
playsound minecraft:item.crossbow.loading_end player @a[tag=!lobby] ~ ~ ~ 0.8 1.2
