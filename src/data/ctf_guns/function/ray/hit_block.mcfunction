execute if score #gun gun.tmp matches 1 run particle minecraft:dust{color:[1.0,0.05,0.05],scale:1.5} ~ ~ ~ 0.05 0.05 0.05 0 4 force @a[tag=!lobby]
execute if score #gun gun.tmp matches 2 run particle minecraft:dust{color:[1.0,0.85,0.25],scale:0.8} ~ ~ ~ 0.05 0.05 0.05 0 2 force @a[tag=!lobby]
particle minecraft:crit ~ ~ ~ 0.05 0.05 0.05 0.1 4 force @a[tag=!lobby]
playsound minecraft:block.stone.hit block @a[tag=!lobby] ~ ~ ~ 1 1.2
