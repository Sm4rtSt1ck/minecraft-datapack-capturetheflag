# As a bot (every think), at it: a hole 2 deep within 2 blocks ahead towards its target (a lure or a
# player, not within 3) -> the jump is armed for 6 ticks: only then the edge is checked every tick
# (ctf_bots:tick/combat -> leap_check). At 4 thinks a second the bot covers about 1.5 blocks. Along the
# graph only on a jump link (bot_jl: ctf_bots:internal/nav/move)
execute if entity @s[tag=bot_navm, tag=!bot_jl] run return 0
execute unless predicate {condition: "minecraft:entity_properties", entity: "this", predicate: {flags: {is_on_ground: true}}} run return 0
execute on target run tag @s add bot_jt
execute if entity @e[type=rabbit, tag=bot_jt] unless entity @e[type=rabbit, tag=bot_jt, distance=..3] facing entity @n[type=rabbit, tag=bot_jt] feet rotated ~ 0 run function ctf_bots:internal/brain/leap_ahead
execute if entity @a[tag=bot_jt] unless entity @a[tag=bot_jt, distance=..3] facing entity @p[tag=bot_jt] feet rotated ~ 0 run function ctf_bots:internal/brain/leap_ahead
tag @e[type=rabbit, tag=bot_jt] remove bot_jt
tag @a remove bot_jt
