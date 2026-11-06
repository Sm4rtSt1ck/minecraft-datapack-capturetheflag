# A bot holding a place (its spot, shooting from where it stands, in cover): it stands asleep (NoAI: no
# swinging at its lure) until something happens. Only on the ground: a NoAI mob doesn't fall, it would
# hang in the air (ctf_bots:internal/brain/think wakes such a bot)
execute if entity @s[tag=bot_guard] run return 0
execute unless predicate {condition: "minecraft:entity_properties", entity: "this", predicate: {flags: {is_on_ground: true}}} run return 0
data merge entity @s {NoAI: 1b}
tag @s add bot_guard
# It faces where enemies came from before (ctf_bots:internal/trick/face_hot)
function ctf_bots:internal/trick/face_hot
