# Remembers the task if it is rarer than the best one of this round (no checks: tests). id
execute unless data storage ctf_loot:config tasks run function ctf_loot:config
# A task missing in the loaded config is reported, not counted
$execute unless data storage ctf_loot:config tasks.$(id).rank run return run tellraw @a[tag=admin] {"text": "[ctf_loot] Unknown task: $(id) (not in the loaded ctf_loot:config - /function ctf_test:loot/reload_config)", "color": "red"}
$execute store result score #r loot.tmp run data get storage ctf_loot:config tasks.$(id).rank
execute if score @s loot.best >= #r loot.tmp run return 0
scoreboard players operation @s loot.best = #r loot.tmp
# Which task it was (its reward is given by the crate)
execute store result storage ctf_loot:tmp tf.pid int 1 run scoreboard players get @s player_id
$data modify storage ctf_loot:tmp tf.id set value "$(id)"
function ctf_loot:internal/set_best with storage ctf_loot:tmp tf
$tellraw @s [{"text": "Loot crate for the next round: ", "color": "gold"}, {"storage": "ctf_loot:config", "nbt": "tasks.$(id).text", "color": "white"}]
execute at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 0.5 1.4
