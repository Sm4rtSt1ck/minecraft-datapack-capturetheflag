scoreboard players remove @s timer 1
function ctf:match/events/ultimate/render

# The nearest dropped ultimate item (an item component check is much cheaper than an NBT selector)
execute as @e[type=item] if items entity @s contents *[custom_data~{tags: ["ultimate"]}] run tag @s add ult.drop
kill @n[type=item, tag=ult.drop]
tag @e[type=item, tag=ult.drop] remove ult.drop

# The damage is dealt by the ultimate player, so the game credits him with the kill
tag @s add ult.self
execute positioned as @e[type=minecraft:evoker_fangs, tag=ultimate] as @a[tag=player, tag=!ult.self, distance=..0.5] run damage @s 4 minecraft:magic by @a[tag=ult.self, limit=1]
tag @s remove ult.self

execute positioned as @s[tag=bomber] run particle smoke ~ ~1.8 ~ 0 0 0 0.0 3 normal

execute if score @s timer matches 0 run function ctf:match/events/ultimate/end
