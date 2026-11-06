# As a bot at the end of its way along the graph (its goal node, or the nearest place to the goal it
# can reach): straight to the goal from now on (bot_final, until a new goal: ctf_bots:internal/nav/reset)
tag @s add bot_final
scoreboard players set #final nav 1
