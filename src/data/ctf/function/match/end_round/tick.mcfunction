#########################################
# TIMER

scoreboard players remove end_round timer 1
execute store result bossbar ctf:match value run scoreboard players get end_round timer

#########################################
# MODULES (rules, shop, guns, inventory, the events of #ctf:tick/combat, the ultimates end)

function #ctf:tick/end_round

execute if score end_round timer matches -2147483648..0 run function ctf:match/end_round/end
