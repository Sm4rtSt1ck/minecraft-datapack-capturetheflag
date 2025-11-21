# Flag breaker
execute as @e[type=item,nbt={Item:{id:"minecraft:stick"}}] positioned as @s run \
    data modify entity @s Owner set from entity @p[tag=attack] UUID

# Flag
execute if score game state matches 4..5 as @e[type=item,nbt={Item:{id:"minecraft:yellow_banner"}}] positioned as @s run \
    data modify entity @s Owner set from entity @n[tag=!defense, tag=!ultimate] UUID
execute if score game state matches 4..5 as @e[type=item,nbt={Item:{id:"minecraft:yellow_banner"}}] positioned as @s run \
    data modify entity @s Owner set from entity @n[tag=attack, tag=!ultimate] UUID

# Main weapon
execute as @a[tag=player] if items entity @s player.cursor *[minecraft:custom_data~{tags:["main weapon"]}] run tag @s add cursor_main_weapon
execute as @a[tag=player] unless items entity @s player.cursor *[minecraft:custom_data~{tags:["main weapon"]}] run tag @s remove cursor_main_weapon
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tags:["main weapon"]}}}}] positioned as @s run \
    data modify entity @s Owner set from entity @n[tag=!cursor_main_weapon, type=!item, nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["main weapon"]}}}]}] UUID

# Secondary weapon
execute as @a[tag=player] if items entity @s player.cursor *[minecraft:custom_data~{tags:["secondary weapon"]}] run tag @s add cursor_secondary_weapon
execute as @a[tag=player] unless items entity @s player.cursor *[minecraft:custom_data~{tags:["secondary weapon"]}] run tag @s remove cursor_secondary_weapon
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tags:["secondary weapon"]}}}}] positioned as @s run \
    data modify entity @s Owner set from entity @n[tag=!cursor_secondary_weapon, type=!item, nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["secondary weapon"]}}}]}] UUID

# He grenade
execute as @a[tag=player] if items entity @s player.cursor *[minecraft:custom_data~{tags:["he_grenade"]}] run tag @s add cursor_he
execute as @a[tag=player] unless items entity @s player.cursor *[minecraft:custom_data~{tags:["he_grenade"]}] run tag @s remove cursor_he
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tags:["he_grenade"]}}}}] positioned as @s run \
    data modify entity @s Owner set from entity @n[tag=!cursor_he, type=!item, nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["he_grenade"]}}}]}] UUID
