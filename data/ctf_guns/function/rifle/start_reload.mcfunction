function ctf_guns:rifle/reserve
execute if score #n inv.tmp matches ..0 run return run function ctf_guns:rifle/no_ammo
execute store result score @s rf.reload run data get storage ctf_guns:config rifle_reload
playsound minecraft:item.crossbow.loading_start player @a[tag=!lobby] ~ ~ ~ 0.8 1.2
