# Advancement reward (ctf_bots:burn_arrow), as a player whose burning arrow hit a bot: the bot just hurt
# burns BODY_FX "fire_arrow" ticks (at least), like a player hit by it
from registry:bots import BODY_FX
advancement revoke @s only ctf_bots:burn_arrow
execute as @e[type=zombified_piglin, tag=ctf_bot, nbt={HurtTime: 10s}] unless score @s bot.fire matches (BODY_FX["fire_arrow"]).. run scoreboard players set @s bot.fire (BODY_FX["fire_arrow"])
