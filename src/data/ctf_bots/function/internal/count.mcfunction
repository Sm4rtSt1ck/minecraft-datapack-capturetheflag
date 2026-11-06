# "attack bots" = the attack bots alive: ctf:match/round/tick counts them with the attackers
execute store result score attack bots if entity @e[type=zombified_piglin, tag=ctf_bot, tag=attack]
