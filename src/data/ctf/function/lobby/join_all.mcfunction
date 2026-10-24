function admin:log/function {name: "lobby/join_all"}

#########################################
# WORLD SETTINGS

gamerule fallDamage false
gamerule doDaylightCycle false
gamerule doWeatherCycle false
time set noon
weather clear

#########################################
# SCOREBOARDS

scoreboard objectives setdisplay sidebar settings

scoreboard players operation game state = lobby state

#########################################
# OTHER

bossbar set ctf:match visible false

execute as @a run function ctf:lobby/join
