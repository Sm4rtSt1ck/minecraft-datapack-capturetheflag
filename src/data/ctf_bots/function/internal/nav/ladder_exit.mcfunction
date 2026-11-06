# Off the top of a ladder (on its wall): room for the bot, a floor; then a walk to B: a ladder link (5)
execute unless block ~ ~ ~ #ctf_bots:gap run return 0
execute unless block ~ ~1 ~ #ctf_bots:gap run return 0
execute if block ~ ~-1 ~ #ctf_bots:gap run return 0
function ctf_bots:internal/nav/walk_reset
scoreboard players set #mode nav 1
execute facing entity @e[type=marker, tag=nav_b, limit=1] feet rotated ~ 0 run function ctf_bots:internal/nav/walk
execute if score #ok nav matches 1.. run scoreboard players set #ok nav 5
