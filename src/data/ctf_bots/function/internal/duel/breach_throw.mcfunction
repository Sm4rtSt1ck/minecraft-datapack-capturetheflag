# As a bot breaching: a grenade straight at the wall (the marker bot_wall), it says so
scoreboard players remove @s bot.he 1
execute anchored eyes facing entity @e[type=marker, tag=bot_wall, limit=1] feet positioned ^ ^ ^0.6 run function ctf_bots:internal/combat/throw {speed: "0.0012"}
playsound minecraft:entity.splash_potion.throw player @a[tag=!lobby] ~ ~ ~ 1 1
kill @e[type=marker, tag=bot_wall]
function ctf_bots:internal/talk/breach
