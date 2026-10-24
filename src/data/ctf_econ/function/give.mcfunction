# Gives the player the money value #<key> econ (see ctf_econ:config). key, reason
$scoreboard players operation @s money += #$(key) econ
function ctf_econ:cap
$tellraw @s [{"text": "+$", "color": "green"}, {"score": {"name": "#$(key)", "objective": "econ"}, "color": "green"}, {"text": " $(reason)", "color": "gray"}]
