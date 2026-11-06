# As a bot chasing a player it must leave: for one tick on the players' team (a mob stops targeting a
# teammate); ctf_bots:tick/combat puts it back the next tick, the next think gives the new target
tag @s add bot_reset
execute if score team bots matches 1 run team join team_2 @s
execute if score team bots matches 2 run team join team_1 @s
