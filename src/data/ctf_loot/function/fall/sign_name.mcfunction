# The owner's name on the sign: a text with a selector is resolved on a temporary item ("set_name"
# with entity "this") and copied to the sign. x, sy, z, owner
summon item_display ~ ~ ~ {Tags: ["ctf.loot_name"], item: {id: "minecraft:stone", count: 1}}
$execute as @a if score @s player_id matches $(owner) run tag @s add ctf.loot_named
item modify entity @e[type=item_display, tag=ctf.loot_name, limit=1] contents {function: "minecraft:set_name", entity: "this", name: {selector: "@a[tag=ctf.loot_named]"}}
$data modify block $(x) $(sy) $(z) front_text.messages[1] set from entity @e[type=item_display, tag=ctf.loot_name, limit=1] item.components."minecraft:custom_name"
$data modify block $(x) $(sy) $(z) back_text.messages[1] set from entity @e[type=item_display, tag=ctf.loot_name, limit=1] item.components."minecraft:custom_name"
kill @e[type=item_display, tag=ctf.loot_name]
tag @a remove ctf.loot_named
