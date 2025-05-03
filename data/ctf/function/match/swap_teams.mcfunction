say match/swap_teams

team modify team_1 displayName "defense"
team modify team_1 color blue
tag team_1 remove attack
tag team_1 add defense
tag @a[team=team_1] remove attack
tag @a[team=team_1] add defense

team modify team_2 displayName "Attack"
team modify team_2 color red
tag team_2 remove defense
tag team_2 add attack
tag @a[team=team_2] remove defense
tag @a[team=team_2] add attack

scoreboard players set @a[tag=player] money 1300

clear @a[tag=player]
