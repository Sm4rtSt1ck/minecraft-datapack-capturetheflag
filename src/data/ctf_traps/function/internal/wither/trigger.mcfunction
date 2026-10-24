execute positioned as @s run kill @n[tag=trap_display, tag=trap.wither, distance=1.2..1.5]

execute positioned as @s run summon area_effect_cloud ~ ~ ~ {Tags:["kc.cloud", "kc.new"], Radius:2f,potion_contents:{custom_effects:[{id:"minecraft:wither",amplifier:1,duration:140}, {id: "minecraft:blindness", amplifier:1, duration:140}]}, Duration:20}

# Kill credit: the cloud gets the owner of the trap (ctf_fight:internal/credit/cloud)
scoreboard players operation @e[type=area_effect_cloud, tag=kc.new] kc.owner = @s kc.owner
tag @e[type=area_effect_cloud, tag=kc.new] remove kc.new

kill @s
