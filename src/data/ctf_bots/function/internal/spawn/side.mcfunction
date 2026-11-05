# The new bots join the bots' team ("team bots") and get its side: team_1 attacks while
# match rounds < swap rounds (ctf:match/round/win_attack). The sides of the bots change only at the
# swap, where all bots are removed (ctf_bots:on/remove)
scoreboard players set #attack bots 0
execute if score team bots matches 1 if score match rounds < swap rounds run scoreboard players set #attack bots 1
execute if score team bots matches 2 if score match rounds >= swap rounds run scoreboard players set #attack bots 1

execute if score team bots matches 1 run team join team_1 @e[type=husk, tag=ctf_bot_new]
execute if score team bots matches 2 run team join team_2 @e[type=husk, tag=ctf_bot_new]
execute if score #attack bots matches 1 run tag @e[type=husk, tag=ctf_bot_new] add attack
execute if score #attack bots matches 0 run tag @e[type=husk, tag=ctf_bot_new] add defense
