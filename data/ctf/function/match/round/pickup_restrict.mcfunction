# Flag breaker
execute as @e[type=item,nbt={Item:{id:"minecraft:stick"}}] positioned as @s run \
    data modify entity @s Owner set from entity @p[tag=attack] UUID

# Flag
execute as @e[type=item,nbt={Item:{id:"minecraft:yellow_banner"}}] positioned as @s run \
    data modify entity @s Owner set from entity @p[tag=attack] UUID
