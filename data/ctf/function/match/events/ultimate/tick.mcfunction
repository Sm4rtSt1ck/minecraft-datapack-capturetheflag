scoreboard players remove @s timer 1
function ctf:match/events/ultimate/render

kill @n[type=item, nbt={Item:{components:{"minecraft:custom_data": {tags: ["ultimate"]}}}}]

# The damage is dealt by the ultimate player, so the game credits him with the kill
tag @s add ult.self
execute positioned as @e[type=minecraft:evoker_fangs, tag=ultimate] as @a[tag=player, tag=!ult.self, distance=..0.5] run damage @s 4 minecraft:magic by @a[tag=ult.self, limit=1]
tag @s remove ult.self

execute positioned as @s[tag=bomber] run particle smoke ~ ~1.8 ~ 0 0 0 0.0 3 normal
# execute unless items entity @s[tag=bomber] armor.head tnt run function ctf:combine_commands {\
#     command_1: 'clear @s tnt',\
#     command_2: 'item replace entity @s armor.head with tnt[custom_data={tags:["ultimate"]}]'\
# }

execute if score @s timer matches 0 run function ctf:match/events/ultimate/end
