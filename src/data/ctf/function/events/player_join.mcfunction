# Modules: the welcome message; a player goes to the lobby if no match is on, or if he had left
# a match that has ended
function #ctf:on/player_join

#########################################
# DETERMINE WHAT TO DO WITH A PLAYER WHEN JOINING A MATCH THAT IS ON

# If player had left during the match that is on and it's warm-up, return to match
execute if score game state = warmup state if score @s[tag=player] match_id = match match_id positioned as @s run tp @s @a[tag=player, sort=furthest, limit=1]
# If player had left during the match that is on and it isn't warm-up, join to spectate
execute if score game state matches 3..6 if score @s match_id = match match_id run function ctf:match/spectate

#########################################

execute unless score @s player_id matches -2147483648..2147483647 run \
    function ctf:combine_commands {\
        command_1: "scoreboard players operation @s player_id = max player_id",\
        command_2: "function ctf:combine_commands {\
            command_1: 'scoreboard players add @s player_id 1', \
            command_2: 'scoreboard players add max player_id 1'\
        }"\
    }

scoreboard players set @s had_left 0
