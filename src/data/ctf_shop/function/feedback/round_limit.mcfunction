$tellraw @s {"text": "Limit: $(max) $(name) per round!", "color": "red"}
execute at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 0.4 0.8
return 0
