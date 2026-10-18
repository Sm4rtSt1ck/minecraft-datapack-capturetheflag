# Ammo on the actionbar while holding the rifle: magazine / reserve
function ctf_guns:rifle/reserve
title @s actionbar [{"text": "AMMO ", "color": "gray"}, {"score": {"name": "@s", "objective": "rf.mag"}, "color": "yellow", "bold": true}, {"text": " / ", "color": "gray"}, {"score": {"name": "#n", "objective": "inv.tmp"}, "color": "white"}]
