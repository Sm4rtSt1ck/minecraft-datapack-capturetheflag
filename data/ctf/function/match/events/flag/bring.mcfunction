scoreboard players add @s money 30

title @s actionbar [{"text":"+$30","color":"green"}]

function ctf:match/events/ultimate/add_point {points: 60}

function ctf:match/round/win_attack
