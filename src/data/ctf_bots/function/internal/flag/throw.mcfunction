# As the bot carrying the flag, a teammate below with a shorter way (bot_rcv): the flag thrown down to
# him (an item flying at him; he fetches it: ctf_bots:internal/team/fetch); it doesn't pick it up again
# for 2 s (bot_thrower)
tag @s remove bot_carrier
effect clear @s minecraft:glowing
kill @e[type=marker, tag=bot_flag_pos]
function ctf_flag:api/summon_flag {target: "@s"}
tag @n[type=item, tag=flag, distance=..2] add bot_thrown
execute facing entity @e[type=zombified_piglin, tag=bot_rcv, limit=1] feet run summon marker ^ ^ ^1 {Tags: ["bot_vec"]}
function ctf_bots:internal/combat/motion {speed: "0.0005", entity: "item", tag: "bot_thrown"}
tag @e[type=item, tag=bot_thrown] remove bot_thrown
tag @s add bot_thrower
scoreboard players set @s bot.nopick 8
function ctf_bots:internal/talk/throw
