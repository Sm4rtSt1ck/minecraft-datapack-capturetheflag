# As a bot, positioned at the lowest block of a ladder near it (ctf_bots:internal/climb/search): its
# ladder marker (bot_ladder, bot.own = its number) here; it walks to it (ctf_bots:internal/climb/go)
from registry:bots import CLIMB
execute as @e[type=marker, tag=bot_ladder] if score @s bot.own = #me bots run kill @s
summon marker ~ ~ ~ {Tags: ["bot_ladder", "map_entity", "bot_new"]}
scoreboard players operation @e[type=marker, tag=bot_new] bot.own = #me bots
tag @e[type=marker, tag=bot_new] remove bot_new
scoreboard players set @s bot.clm (CLIMB["go"])
return 1
