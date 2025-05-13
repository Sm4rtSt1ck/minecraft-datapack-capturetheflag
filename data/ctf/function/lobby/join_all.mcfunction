gamerule fallDamage false

#########################################

scoreboard objectives setdisplay sidebar map_vote
scoreboard players reset * map_vote
# IMPORTANT! change to 0 after fully adding vote status
scoreboard players set game status 1
bossbar set ctf:match visible false

execute as @a run function ctf:lobby/join
