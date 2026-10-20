# Remembers the task if it is rarer than the best one of this round (no checks: tests). id
execute unless data storage ctf_loot:config tasks run function ctf_loot:config
$execute store result score #r loot.tmp run data get storage ctf_loot:config tasks.$(id).rank
execute if score @s loot.best >= #r loot.tmp run return 0
scoreboard players operation @s loot.best = #r loot.tmp
$tellraw @s [{"text": "Loot crate for the next round: ", "color": "gold"}, {"storage": "ctf_loot:config", "nbt": "tasks.$(id).text", "color": "white"}]
execute at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 0.5 1.4
