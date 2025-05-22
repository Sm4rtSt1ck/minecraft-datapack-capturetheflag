function admin:log/function {name: "match/end/start"}

scoreboard players set game state 6
# Tiemr to lobby 15 secs (300 ticks)
scoreboard players set end timer 300
bossbar set ctf:match max 300

kill @e[tag=flag]
kill @e[tag=trap]
kill @e[tag=map_entity]
