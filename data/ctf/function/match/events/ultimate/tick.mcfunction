xp set @s 40 levels
xp add @s -1
xp set @s 0 levels

scoreboard players remove @s timer 1

kill @n[type=item, nbt={Item:{components:{"minecraft:custom_data": {tags: ["ultimate"]}}}}]

execute if score @s timer matches 0 run function ctf:match/events/ultimate/end
