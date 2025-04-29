say match/swap_teams

team modify team_1 displayName "Defence"
team modify team_1 color blue
tag team_1 remove attack
tag team_1 add defence
tag @a[team=team_1] remove attack
tag @a[team=team_1] add defence

team modify team_2 displayName "Attack"
team modify team_2 color red
tag team_2 remove defence
tag team_2 add attack
tag @a[team=team_2] remove defence
tag @a[team=team_2] add attack

clear @a[tag=player]
