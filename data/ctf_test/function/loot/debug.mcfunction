# Why didn't my loot crate fall? Shows everything the crate depends on
tellraw @s {"text": "=== LOOT CRATE DEBUG ===", "color": "gold", "bold": true}
# An empty value after the colon: no task this round (or the objective loot.best doesn't exist)
tellraw @s [{"text": "Best task of the round (rank 1..5): ", "color": "gray"}, {"score": {"name": "@s", "objective": "loot.best"}, "color": "yellow"}]
execute store result storage ctf_test:tmp dbg.pid int 1 run scoreboard players get @s player_id
function ctf_test:loot/debug_task with storage ctf_test:tmp dbg
execute if entity @s[tag=attack] run tellraw @s {"text": "Team: attack (OK)", "color": "green"}
execute unless entity @s[tag=attack] run tellraw @s {"text": "Team: NOT attack - crates fall only for attackers (after a team swap you are a defender)", "color": "red"}
execute unless entity @s[tag=player] run tellraw @s {"text": "Not tagged \"player\" (not in the match)", "color": "red"}
tellraw @s [{"text": "Game state: ", "color": "gray"}, {"score": {"name": "game", "objective": "state"}, "color": "yellow"}, {"text": " (freeze = ", "color": "gray"}, {"score": {"name": "freeze", "objective": "state"}, "color": "yellow"}, {"text": ", round = ", "color": "gray"}, {"score": {"name": "round", "objective": "state"}, "color": "yellow"}, {"text": ")", "color": "gray"}]
tellraw @s [{"text": "Map (result map_vote, 1 = test_map): ", "color": "gray"}, {"score": {"name": "result", "objective": "map_vote"}, "color": "yellow"}]
execute if data storage ctf_loot:config tasks.flag_bring.reward run tellraw @s {"text": "Config: loaded with task rewards (OK)", "color": "green"}
execute unless data storage ctf_loot:config tasks.flag_bring.reward run tellraw @s {"text": "Config: old or not loaded - /function ctf_test:loot/reload_config", "color": "red"}
tellraw @s [{"text": "Tasks in the loaded config: ", "color": "gray"}, {"storage": "ctf_loot:config", "nbt": "tasks", "color": "white"}]
