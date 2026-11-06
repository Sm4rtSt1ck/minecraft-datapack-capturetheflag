# Lobby, as a player at a template: a graph for the view (#lshow nav 1). A node marker at every bot marker
# of the template near him (nav_tmp; an AN is no node), the points the bots learned on this map
# (ctf_bots:internal/learn/lobby_points), then the bake as in a match (it reports when ready)
function ctf_bots:internal/nav/lobby_clear
scoreboard players set #lshow nav 1
execute as @e[type=armor_stand, tag=build_bot, distance=..160] at @s run function ctf_bots:internal/nav/lobby_copy
function ctf_bots:internal/learn/lobby_points
function ctf_bots:internal/nav/bake_start
tellraw @s {"text": "Building the bot graph of this template...", "color": "yellow"}
schedule function ctf_bots:internal/nav/show_tick 1t
