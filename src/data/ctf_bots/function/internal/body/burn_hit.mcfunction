# Advancement reward (ctf_bots:burn_hit), as a player who hit a bot with a fire aspect weapon: the bot
# just hurt near him burns BODY_FX "fire_hit" ticks (at least), like a player hit by it
from registry:bots import BODY_FX
advancement revoke @s only ctf_bots:burn_hit
execute as @e[type=zombified_piglin, tag=ctf_bot, distance=..8, nbt={HurtTime: 10s}] unless score @s bot.fire matches (BODY_FX["fire_hit"]).. run scoreboard players set @s bot.fire (BODY_FX["fire_hit"])
