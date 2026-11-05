# As a new bot: a player_id like a player's (ctf:events/player_join): the kill credit, the death camera
scoreboard players add max player_id 1
scoreboard players operation @s player_id = max player_id
