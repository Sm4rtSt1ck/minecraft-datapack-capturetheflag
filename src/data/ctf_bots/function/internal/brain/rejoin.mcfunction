# ctf_bots:tick/combat, as a bot dropped from its target a tick ago: back in the bots' team
tag @s remove bot_reset
execute if score team bots matches 1 run team join team_1 @s
execute if score team bots matches 2 run team join team_2 @s
