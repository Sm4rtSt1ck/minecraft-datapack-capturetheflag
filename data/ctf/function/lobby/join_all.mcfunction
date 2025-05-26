function admin:log/function {name: "lobby/join_all"}

gamerule fallDamage false
gamerule doDaylightCycle false
gamerule doWeatherCycle false
time set noon
weather clear

#########################################

scoreboard objectives setdisplay sidebar map_vote
scoreboard players reset * map_vote
# IMPORTANT! change to 0 after fully adding vote state
scoreboard players set game state 1
bossbar set ctf:match visible false

execute as @a run function ctf:lobby/join
