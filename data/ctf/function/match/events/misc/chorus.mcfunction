scoreboard players reset @s just_used_chorus

give @s chorus_fruit
execute if score game state matches 3 as @s run function ctf:match/maps/call_current {function: "freeze"}
tellraw @s {"text": "You cannot use this now!", "color": "red"}
