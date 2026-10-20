# Start of freeze: the old crates are gone; every attacker who completed a task gets a crate
execute as @e[type=marker, tag=ctf.loot_box] at @s run function ctf_loot:box/remove_silent
kill @e[type=marker, tag=ctf.loot_fall]
tag @a[tag=attack, tag=player, scores={loot.best=1..}] add ctf.loot_pending
function ctf:match/maps/call_current {function: "loot"}
tellraw @a[tag=ctf.loot_pending] {"text": "No free landing point for your loot crate on this map", "color": "red"}
tag @a remove ctf.loot_pending
scoreboard players reset * loot.best
scoreboard players reset * loot.kills
