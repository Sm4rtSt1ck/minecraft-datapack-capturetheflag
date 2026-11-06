# As a bot, positioned at a goal: #path bots = the length of its way there (blocks). Along the graph
# when it is ready (the field of the node nearest to the goal: the distance of the node nearest to
# the bot + the bot's distance to that node), else straight
function ctf_bots:internal/team/dist
scoreboard players operation #path bots = #dist bots
execute unless score #ready nav matches 1 run return 0
scoreboard players set #want nav 0
execute as @e[type=marker, tag=nav_node, sort=nearest, limit=1] run scoreboard players operation #want nav = @s nav.id
execute if score #want nav matches 0 run return 0
function ctf_bots:internal/nav/class
function ctf_bots:internal/nav/slot
scoreboard players set #d nav 1000000
execute at @s as @e[type=marker, tag=nav_node, sort=nearest, limit=1] run function ctf_bots:internal/nav/node_d
execute if score #d nav matches 1000000.. run return 0
scoreboard players set #k bots 10
scoreboard players operation #d nav /= #k bots
execute at @s at @n[type=marker, tag=nav_node] run function ctf_bots:internal/team/dist
scoreboard players operation #path bots = #d nav
scoreboard players operation #path bots += #dist bots
