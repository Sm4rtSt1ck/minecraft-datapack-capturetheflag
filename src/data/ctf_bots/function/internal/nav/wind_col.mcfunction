# Up the column above A a block a time (#wh nav: tenths risen) while there is room; at B's level: the
# walk test to B (#mode 0, from the air: over the gap onto it): a wind link (8)
execute unless block ~ ~ ~ #ctf_bots:gap run return 0
execute unless block ~ ~1 ~ #ctf_bots:gap run return 0
execute if score #wh nav < #dy nav positioned ~ ~1 ~ run return run function ctf_bots:internal/nav/wind_col_up
execute unless block ~ ~2 ~ #ctf_bots:gap run return 0
function ctf_bots:internal/nav/walk_reset
scoreboard players set #mode nav 0
execute facing entity @e[type=marker, tag=nav_b, limit=1] feet rotated ~ 0 run function ctf_bots:internal/nav/walk
execute if score #ok nav matches 1.. run scoreboard players set #ok nav 8
