scoreboard players operation @s money += #amount econ
function ctf_econ:cap
$tellraw @s [{"text": "+$", "color": "green"}, {"score": {"name": "#amount", "objective": "econ"}, "color": "green"}, {"text": " loss bonus (", "color": "gray"}, {"score": {"name": "#streak.$(side)", "objective": "econ"}, "color": "gray"}, {"text": " in a row)", "color": "gray"}]
