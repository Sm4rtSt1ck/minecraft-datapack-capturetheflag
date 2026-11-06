# As a bot, positioned where it must go (ctf_bots:internal/brain/lure_here: far / not in sight): along
# the graph. Its goal node: the node nearest to here; its field (ctf_bots:internal/nav/slot); a new goal:
# a new entry (ctf_bots:internal/nav/reset); then its step (ctf_bots:internal/nav/step). At its goal
# node or no way along the graph: straight here
scoreboard players set #want nav 0
execute as @e[type=marker, tag=nav_node, sort=nearest, limit=1] run scoreboard players operation #want nav = @s nav.id
execute if score #want nav matches 0 run return run function ctf_bots:internal/brain/lure_direct
function ctf_bots:internal/nav/class
function ctf_bots:internal/nav/slot
execute unless score @s bot.gn = #want nav run function ctf_bots:internal/nav/reset
scoreboard players operation @s bot.gn = #want nav
tag @s add bot_navm
execute at @s run function ctf_bots:internal/nav/step
execute if score #final nav matches 1.. run function ctf_bots:internal/nav/off
execute if score #final nav matches 1.. run function ctf_bots:internal/brain/lure_direct
