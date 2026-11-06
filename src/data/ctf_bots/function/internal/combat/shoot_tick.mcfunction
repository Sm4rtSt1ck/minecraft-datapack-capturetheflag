# Every tick, as a bot shooting (tag bot_shoot), at it: the player it fights gets the tag bot_tc
# (ctf_bots:internal/combat/target). It shoots only while it sees him (bot_los, at its think) and
# doesn't wait (bot_wait: another weapon taken)
function ctf_bots:internal/combat/target
execute unless entity @a[tag=bot_tc] run return run tag @s remove bot_shoot
execute if entity @s[tag=bot_los, tag=!bot_wait] run function ctf_bots:internal/combat/shoot
tag @a remove bot_tc
