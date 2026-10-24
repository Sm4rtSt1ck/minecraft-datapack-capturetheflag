tellraw @s {"text": "No free space in the hotbar!", "color": "red"}
execute at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.4 0.8
return 0
