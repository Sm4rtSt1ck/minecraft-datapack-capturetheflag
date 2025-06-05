scoreboard players add @s money 100

title @s actionbar [{"text":"+$100","color":"green"}]

function ctf:match/events/ultimate/add_point {points: 60}

function ctf:match/round/win_attack
