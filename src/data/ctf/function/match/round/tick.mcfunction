#########################################
# TIMER

scoreboard players remove round timer 1
execute store result bossbar ctf:match value run scoreboard players get round timer

#########################################
# MODULES (rules, shop, guns, inventory, then the events of #ctf:tick/combat)

function #ctf:tick/round

#########################################
# WIN LOGIC

# If all attack team is dead -> defense wins (the attack bots alive: "attack bots", BOTS.md)
execute unless entity @a[tag=!dead, tag=attack] unless score attack bots matches 1.. run function ctf:match/round/win_defense

# If time is over -> defense wins
execute if score round timer matches -2147483648..0 run function ctf:match/round/win_defense

# Modules: if flag is stolen -> attack wins
function #ctf:tick/round_win
