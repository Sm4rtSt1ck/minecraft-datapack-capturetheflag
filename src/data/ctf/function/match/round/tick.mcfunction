#########################################
# TIMER

scoreboard players remove round timer 1
execute store result bossbar ctf:match value run scoreboard players get round timer

#########################################
# MODULES (rules, shop, guns, inventory, then the events of #ctf:tick/combat)

function #ctf:tick/round

#########################################
# WIN LOGIC

# If all attack team is dead -> defense wins
execute unless entity @a[tag=!dead, tag=attack] run function ctf:match/round/win_defense

# If time is over -> defense wins
execute if score round timer matches -2147483648..0 run function ctf:match/round/win_defense

# If flag is stolen -> attack wins
execute positioned as @e[type=armor_stand, tag=win_trigger] as @a[tag=attack, distance=..2.5] if function ctf:match/helpers/has_banner run function ctf:match/events/flag/bring
