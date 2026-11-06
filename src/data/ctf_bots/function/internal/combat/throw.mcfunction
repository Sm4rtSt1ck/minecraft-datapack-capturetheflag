# As a bot, positioned and rotated: the grenade flies this way
summon potion ~ ~ ~ {Tags: ["bot_grenade"], Item: {id: "minecraft:lingering_potion", count: 1, components: {"minecraft:custom_data": {tags: ["he_grenade"]}}}}
summon marker ^ ^ ^1 {Tags: ["bot_vec"]}
function ctf_bots:internal/combat/motion {speed: "0.0009", entity: "potion", tag: "bot_grenade"}
data modify entity @n[type=potion, tag=bot_grenade] Owner set from entity @s UUID
summon armor_stand ~ ~ ~ {Marker: true, Invisible: true, Tags: ["he_grenade", "kc.new"]}
scoreboard players operation @e[type=armor_stand, tag=kc.new] kc.owner = @s player_id
tag @e[type=armor_stand, tag=kc.new] remove kc.new
tag @e[type=potion, tag=bot_grenade] remove bot_grenade
