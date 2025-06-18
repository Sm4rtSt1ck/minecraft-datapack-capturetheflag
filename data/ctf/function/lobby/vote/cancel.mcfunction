scoreboard players operation game state = lobby state

bossbar set ctf:match visible false
scoreboard objectives setdisplay sidebar settings

clear @a

title @a title {"text": "VOTING CANCELLED", "color": "gold"}
title @a subtitle {"text": "no one voted for the map", "color": "yellow"}
