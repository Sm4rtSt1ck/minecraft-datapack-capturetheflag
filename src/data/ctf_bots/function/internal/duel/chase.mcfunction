# As a bot running at the player tagged bot_want: straight (he is near and in sight:
# ctf_bots:internal/nav/direct_chase; or no graph), else the shortest way to him along the graph
# (the detour: ctf_bots:internal/brain/detour, until he can be chased straight)
execute unless score #ready nav matches 1 run return run function ctf_bots:internal/brain/target_want
execute at @p[tag=bot_want] store result score #dir nav run function ctf_bots:internal/nav/direct_chase
execute if score #dir nav matches 1 run return run function ctf_bots:internal/brain/target_want
tag @p[tag=bot_want] add bot_jt
function ctf_bots:internal/brain/detour_pick
tag @a remove bot_jt
function ctf_bots:internal/brain/detour
return 1
