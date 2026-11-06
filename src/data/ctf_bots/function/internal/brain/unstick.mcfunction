# As a bot standing still too long with nothing to wait for: its way along the graph again (a new
# entry), its search spot given up (checked), a step to a random side
scoreboard players set @s bot.idle 0
function ctf_bots:internal/nav/reset
execute as @e[type=marker, tag=bot_nav] if score @s bot.sc = #me bots run tag @s add bot_chk
tag @s add bot_jumper
execute rotated as @s rotated ~90 0 if predicate {condition: "minecraft:random_chance", chance: 0.5} run summon marker ^ ^ ^1 {Tags: ["bot_vec"]}
execute unless entity @e[type=marker, tag=bot_vec] rotated as @s rotated ~-90 0 run summon marker ^ ^ ^1 {Tags: ["bot_vec"]}
function ctf_bots:internal/combat/motion {speed: "0.0004", entity: "zombified_piglin", tag: "bot_jumper"}
data modify entity @s Motion[1] set value 0.3d
tag @s remove bot_jumper
