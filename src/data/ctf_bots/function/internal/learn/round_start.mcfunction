# Round start (learning on, a map loaded): the flag the players hid counted at its point (lrn.hide); the
# routes the attack bots took marked (ctf_bots:internal/learn/routes_mark)
execute unless score Bots_learn settings matches 1 run return 0
execute unless score #map lrn matches 1.. run return 0
execute unless entity @e[type=zombified_piglin, tag=ctf_bot, tag=defense] at @n[type=armor_stand, tag=flag] as @n[type=marker, tag=lrn_pt, distance=..8] run scoreboard players add @s lrn.hide 10
function ctf_bots:internal/learn/routes_mark
