scoreboard players reset @s just_used_chorus

execute if score game state matches 3 if score result map_vote matches 1 as @s run function ctf:match/maps/test_map/freeze
execute if score game state matches 3 if score result map_vote matches 2 as @s run function ctf:match/maps/green_mine/freeze
execute if score game state matches 3 if score result map_vote matches 3 as @s run function ctf:match/maps/night_club/freeze
execute if score game state matches 3 if score result map_vote matches 4 as @s run function ctf:match/maps/farm/freeze
execute if score game state matches 3 if score result map_vote matches 5 as @s run function ctf:match/maps/railway_station/freeze
