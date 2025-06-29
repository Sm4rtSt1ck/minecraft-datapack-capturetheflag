execute if score @s ultimate_category matches 1 run xp set @s 40 levels
execute if score @s ultimate_category matches 2 run xp set @s 63 levels
execute if score @s ultimate_category matches 3 run xp set @s 51 levels
execute if score @s ultimate_category matches 4 run xp set @s 51 levels
execute if score @s ultimate_category matches 5 run xp set @s 16 levels
xp add @s -1
xp set @s 0 levels

scoreboard players remove @s timer 1

kill @n[type=item, nbt={Item:{components:{"minecraft:custom_data": {tags: ["ultimate"]}}}}]

execute positioned as @e[type=minecraft:evoker_fangs, tag=ultimate] as @a[tag=player, distance=..0.5] run damage @s 4

execute positioned as @s[tag=bomber] run particle smoke ~ ~1.8 ~ 0 0 0 0.0 3 normal
execute unless items entity @s[tag=bomber] armor.head tnt run function ctf:combine_commands {\
    command_1: 'clear @s tnt',\
    command_2: 'item replace entity @s armor.head with tnt[custom_data={tags:["ultimate"]}]'\
}

execute if score @s timer matches 0 run function ctf:match/events/ultimate/end
