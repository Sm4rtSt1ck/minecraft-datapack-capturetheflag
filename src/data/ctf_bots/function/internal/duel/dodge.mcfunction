# As a bot running at a ranged enemy (bot_want): a quick step to a random side
tag @s add bot_jumper
execute if predicate {condition: "minecraft:random_chance", chance: 0.5} facing entity @p[tag=bot_want] feet rotated ~90 0 run summon marker ^ ^ ^1 {Tags: ["bot_vec"]}
execute unless entity @e[type=marker, tag=bot_vec] facing entity @p[tag=bot_want] feet rotated ~-90 0 run summon marker ^ ^ ^1 {Tags: ["bot_vec"]}
function ctf_bots:internal/combat/motion {speed: "0.0004", entity: "zombified_piglin", tag: "bot_jumper"}
data modify entity @s Motion[1] set value 0.15d
tag @s remove bot_jumper
