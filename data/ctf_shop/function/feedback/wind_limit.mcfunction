tellraw @s {"text": "Limit: 10 wind charges in the inventory!", "color": "red"}
execute at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.4 0.8
return 0
