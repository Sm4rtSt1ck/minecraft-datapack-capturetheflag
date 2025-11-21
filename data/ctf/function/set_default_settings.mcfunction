scoreboard players set swap rounds 8


scoreboard players set Music settings 1

scoreboard players operation Rounds_to_win settings = swap rounds
scoreboard players operation Rounds_to_win settings += 1 number

scoreboard players set max ultimate 200

function ctf:lobby/settings/update_signs
