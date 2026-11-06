# Every tick, as a bot shooting (tag bot_shoot), at it: its target player gets the tag bot_tc. It
# shoots only while it sees him (bot_los, at its think) and doesn't wait (bot_wait: another weapon taken)
execute on target if entity @s[type=player, tag=player, tag=!dead] run tag @s add bot_tc
execute unless entity @a[tag=bot_tc] run return run tag @s remove bot_shoot
execute if entity @s[tag=bot_los, tag=!bot_wait] run function ctf_bots:internal/combat/shoot
tag @a remove bot_tc
