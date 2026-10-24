scoreboard players reset @s just_used_chorus

tag @s add chorus
execute if score game state = freeze state as @s run function ctf:match/maps/call_current {function: "freeze"}
tellraw @s {"text": "You cannot use this now!", "color": "red"}

schedule function ctf:match/events/misc/chorus/chorus_2 1t
