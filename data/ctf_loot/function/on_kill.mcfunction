# Runs as the killer (ctf:match/events/fight/kill). Attackers only, no teamkills (the attack is red)
execute unless entity @s[tag=attack] run return 0
execute if entity @s[scores={tk.red=1..}] run return 0
function ctf_loot:count_kill
execute unless items entity @s weapon.mainhand * run function ctf_loot:task {id: "fist"}
