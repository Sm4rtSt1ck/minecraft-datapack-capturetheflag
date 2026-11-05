# ctf:match/start, the bots are on (settings Bots): all players join one random team (team_1 starts
# in attack, team_2 in defense), the other team is the bots' one ("team bots" = its number)
execute store result score team bots run random value 1..2
execute if score team bots matches 1 run team join team_2 @a[tag=player]
execute if score team bots matches 2 run team join team_1 @a[tag=player]
