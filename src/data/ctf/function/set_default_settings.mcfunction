scoreboard players set swap rounds 8


scoreboard players set Music settings 1

# Bots (BOTS.md): off; their number when on
scoreboard players set Bots settings 0
scoreboard players set Bots_count settings 5

scoreboard players operation Rounds_to_win settings = swap rounds
scoreboard players operation Rounds_to_win settings += 1 number

scoreboard players set max ultimate 200

