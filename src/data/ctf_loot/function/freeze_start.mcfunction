# Start of freeze: the old crates are gone; every attacker who completed a task gets a crate
execute as @e[type=marker, tag=ctf.loot_box] at @s run function ctf_loot:box/remove_silent
kill @e[type=marker, tag=ctf.loot_fall]
function ctf_loot:items/clear
# 10 kills in the match (once per match): counted for the attackers at the start of freeze
execute as @a[tag=attack, tag=player, tag=!loot.k10] run function ctf_loot:kills_total

tag @a[tag=attack, tag=player, scores={loot.best=1..}] add ctf.loot_pending
function ctf_maps:api/call_current {function: "loot"}
tellraw @a[tag=ctf.loot_pending] {"text": "No free landing point for your loot crate on this map", "color": "red"}
tag @a remove ctf.loot_pending
scoreboard players reset * loot.best
scoreboard players reset * loot.kills
# Damage of the round ("unkillable")
scoreboard players reset * loot.dmg
tag @a remove loot.unkill
data remove storage ctf_loot:best players
# Click catchers of an older version of the crates
kill @e[type=interaction, tag=ctf.loot_click]
