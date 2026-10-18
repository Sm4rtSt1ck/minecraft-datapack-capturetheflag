scoreboard players operation @s money -= #teamkill econ
function ctf_econ:cap
tellraw @s [{"text": "-$", "color": "red"}, {"score": {"name": "#teamkill", "objective": "econ"}, "color": "red"}, {"text": " teamkill", "color": "gray"}]
