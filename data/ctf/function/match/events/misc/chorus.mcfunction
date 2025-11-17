scoreboard players reset @s just_used_chorus

execute if score game state matches 3 as @s run function ctf:match/maps/call_current {function: "freeze"}
