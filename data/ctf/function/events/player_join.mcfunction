execute unless score @s match_id = match match_id run function ctf:lobby/join
execute if score game status matches 0..1 run function ctf:lobby/join

execute if score @s[tag=player] match_id = match match_id if score game status matches 2 positioned as @s run tp @s @a[tag=player, sort=furthest, limit=1]

execute if score @s match_id = match match_id if score game status matches 3..5 run function ctf:match/spectate

scoreboard players set @s had_left 0
