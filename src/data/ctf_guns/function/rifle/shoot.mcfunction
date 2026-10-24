# Runs as the shooter, at his position
execute unless data storage ctf_guns:config rifle_rate run function ctf_guns:config
scoreboard players remove @s rf.mag 1
scoreboard players add @s rf.cd 20

# Spread: base + step per shot of the burst, up to max; halved while sneaking
execute store result score #s gun.tmp run data get storage ctf_guns:config rifle_spread_base
execute store result score #k gun.tmp run data get storage ctf_guns:config rifle_spread_step
scoreboard players operation #add gun.tmp = @s rf.spray
scoreboard players operation #add gun.tmp *= #k gun.tmp
scoreboard players operation #s gun.tmp += #add gun.tmp
execute store result score #max gun.tmp run data get storage ctf_guns:config rifle_spread_max
execute if score #s gun.tmp > #max gun.tmp run scoreboard players operation #s gun.tmp = #max gun.tmp
scoreboard players set #k gun.tmp 2
execute if predicate ctf_guns:sneaking run scoreboard players operation #s gun.tmp /= #k gun.tmp
function ctf_guns:spread
execute unless score @s rf.spray matches 20.. run scoreboard players add @s rf.spray 1

playsound minecraft:entity.firework_rocket.blast player @a[tag=!lobby] ~ ~ ~ 3 1.6
playsound minecraft:item.crossbow.shoot player @a[tag=!lobby] ~ ~ ~ 2 1.8

scoreboard players set #gun gun.tmp 2
tag @s add gun.shooter
function ctf_guns:ray/fire with storage ctf_guns:shot
tag @s remove gun.shooter

execute unless score @s rf.mag matches 1.. run function ctf_guns:rifle/start_reload
