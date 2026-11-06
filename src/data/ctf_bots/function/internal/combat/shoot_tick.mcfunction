# Every tick, as a bot shooting (tag bot_shoot), at it: its target player gets the tag bot_tc
execute on target if entity @s[type=player, tag=player, tag=!dead] run tag @s add bot_tc
execute unless entity @a[tag=bot_tc] run return run tag @s remove bot_shoot
function ctf_bots:internal/combat/shoot
tag @a remove bot_tc
