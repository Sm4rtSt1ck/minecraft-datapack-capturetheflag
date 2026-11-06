# As a bot with a grenade, its target within the grenade range: thrown at its feet (an arc: 25
# degrees up). The thrown potion + the grenade marker of ctf_grenades (it explodes on landing), the
# bot as its owner
scoreboard players remove @s bot.he 1
execute anchored eyes facing entity @a[tag=bot_tc, limit=1] feet rotated ~ ~-25 positioned ^ ^ ^0.6 run function ctf_bots:internal/combat/throw
playsound minecraft:entity.splash_potion.throw player @a[tag=!lobby] ~ ~ ~ 1 1
