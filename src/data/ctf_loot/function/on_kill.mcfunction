# Runs as the killer (ctf:match/events/fight/kill)
# Kills of the whole match (both sides, no teamkills): the "kills_total" task (ctf_loot:freeze_start)
execute unless entity @s[tag=attack, scores={tk.red=1..}] unless entity @s[tag=defense, scores={tk.blue=1..}] run scoreboard players add @s loot.ktotal 1

# Attackers only, no teamkills (the attack is red)
execute unless entity @s[tag=attack] run return 0
execute if entity @s[scores={tk.red=1..}] run return 0
function ctf_loot:count_kill
execute unless items entity @s weapon.mainhand * run function ctf_loot:task {id: "fist"}
