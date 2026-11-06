# As the bot carrying the flag, a stronger teammate next to it (bot_rcv): the flag handed over
tag @s remove bot_carrier
effect clear @s minecraft:glowing
tag @e[type=zombified_piglin, tag=bot_rcv] add bot_carrier
execute as @e[type=zombified_piglin, tag=bot_rcv] run function ctf_flag:api/pickup
kill @e[type=marker, tag=bot_flag_pos]
execute at @e[type=zombified_piglin, tag=bot_rcv] run summon marker ~ ~ ~ {Tags: ["bot_flag_pos"]}
function ctf_bots:internal/talk/pass
