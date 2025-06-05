# Flag breaker
execute as @e[type=item,nbt={Item:{id:"minecraft:stick"}}] positioned as @s run \
    data modify entity @s Owner set from entity @p[tag=attack] UUID

# Flag
execute if score game state matches 4..5 as @e[type=item,nbt={Item:{id:"minecraft:yellow_banner"}}] positioned as @s run \
    data modify entity @s Owner set from entity @n[tag=!defense, tag=!ultimate] UUID
execute if score game state matches 4..5 as @e[type=item,nbt={Item:{id:"minecraft:yellow_banner"}}] positioned as @s run \
    data modify entity @s Owner set from entity @n[tag=attack, tag=!ultimate] UUID

# Main weapon
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tags:["main weapon"]}}}}] positioned as @s run \
    data modify entity @s Owner set from entity @n[type=!item,nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["main weapon"]}}}]}] UUID

# Secondary weapon
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tags:["secondary weapon"]}}}}] positioned as @s run \
    data modify entity @s Owner set from entity @n[type=!item,nbt=!{Inventory:[{components:{"minecraft:custom_data":{tags:["secondary weapon"]}}}]}] UUID
