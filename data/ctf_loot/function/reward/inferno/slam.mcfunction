# Runs as the player, positioned in front of him (where he hit): area damage to enemies + a fire area
execute if entity @s[tag=attack] as @a[tag=defense, tag=player, gamemode=!spectator, distance=..3] run damage @s 4 minecraft:player_attack by @a[tag=loot.inferno_user, limit=1]
execute if entity @s[tag=defense] as @a[tag=attack, tag=player, gamemode=!spectator, distance=..3] run damage @s 4 minecraft:player_attack by @a[tag=loot.inferno_user, limit=1]
particle minecraft:flame ~ ~0.5 ~ 1.2 0.4 1.2 0.05 60 force @a[tag=!lobby]
particle minecraft:lava ~ ~0.5 ~ 1 0.3 1 0 15 force @a[tag=!lobby]
playsound minecraft:item.firecharge.use player @a[tag=!lobby] ~ ~ ~ 1.5 0.7
playsound minecraft:entity.blaze.shoot player @a[tag=!lobby] ~ ~ ~ 1 0.6

# Fire area for 5 seconds (fire doesn't spread: doFireTick is off). Its burn kills are credited to the user
summon marker ~ ~ ~ {Tags: ["ctf.fire_zone", "ctf.fire_new"]}
scoreboard players set @e[type=marker, tag=ctf.fire_new] loot.t 100
scoreboard players operation @e[type=marker, tag=ctf.fire_new] kc.owner = @s player_id
tag @e[type=marker, tag=ctf.fire_new] remove ctf.fire_new
fill ~-2 ~-1 ~-2 ~2 ~1 ~2 fire replace air
