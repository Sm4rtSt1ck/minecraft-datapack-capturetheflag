# Start of a half (match start, team swap): starting money and loss streaks
function ctf_econ:config
scoreboard players operation @a[tag=player] money = #start econ
scoreboard players set #streak.attack econ 0
scoreboard players set #streak.defense econ 0
