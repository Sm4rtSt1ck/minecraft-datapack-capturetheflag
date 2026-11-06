# Every tick, as a bot with the jump armed, at it: a gap towards its target (a lure or a player) is jumped over
# (ctf_bots:internal/brain/leap); only on the ground, not next to the target
execute unless predicate {condition: "minecraft:entity_properties", entity: "this", predicate: {flags: {is_on_ground: true}}} run return 0
execute on target run tag @s add bot_jt
execute if entity @e[type=rabbit, tag=bot_jt] unless entity @e[type=rabbit, tag=bot_jt, distance=..3] facing entity @n[type=rabbit, tag=bot_jt] feet rotated ~ 0 run function ctf_bots:internal/brain/leap
execute if entity @a[tag=bot_jt] unless entity @a[tag=bot_jt, distance=..3] facing entity @p[tag=bot_jt] feet rotated ~ 0 run function ctf_bots:internal/brain/leap
tag @e[type=rabbit, tag=bot_jt] remove bot_jt
tag @a remove bot_jt
