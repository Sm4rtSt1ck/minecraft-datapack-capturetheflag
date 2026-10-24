# #ctf:on/player_join (as the player, ctf:events/player_join)
#########################################
# WELCOME MESSAGE

title @s title {"text":"WELCOME TO", "color": "#ff00bf"}
title @s subtitle [\
    {"color": "#0000FF", "text": "C", "shadow_color": 0, "bold": true},\
    {"color": "#1500ff", "text": "a"},\
    {"color": "#2b00ff", "text": "p"},\
    {"color": "#4800ff", "text": "t"},\
    {"color": "#6600ff", "text": "u"},\
    {"color": "#8c00ff", "text": "r"},\
    {"color": "#bf00ff", "text": "e"},\
    {"color": "#ff00ff", "text": "T"},\
    {"color": "#ff00bf", "text": "h"},\
    {"color": "#ff008c", "text": "e"},\
    {"color": "#ff0066", "text": "F"},\
    {"color": "#ff0044", "text": "l"},\
    {"color": "#ff002b", "text": "a"},\
    {"color": "#FF0000", "text": "g"}\
]


#########################################
# THE LOBBY (the match cases: ctf:events/player_join)

# If match is not on, join lobby
execute if score game state matches 0..1 run function ctf_lobby:api/join
# If player had left during the match that had been ended but another match is on, join lobby
execute if score game state matches 2..7 unless score @s match_id = match match_id run function ctf_lobby:api/join
