execute if score game status matches 0..1 run function ctf:lobby/tick

execute if score game status matches 1 as @a[tag=lobby] run function ctf:lobby/vote/tick

execute if score game status matches 2 run function ctf:match/warmup/tick

execute if score game status matches 3 run function ctf:match/freeze/tick

execute if score game status matches 4 run function ctf:match/round/tick

execute if score game status matches 5 run function ctf:match/end_round/tick

execute if score game status matches 6 run function ctf:match/end/tick
