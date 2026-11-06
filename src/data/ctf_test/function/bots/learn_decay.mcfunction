# How fast the bots forget: the learned counts x pct / 100 once a match, at the start of the game
# (the setting Bots_decay; 100: never; BOTS.md stage 11). /function ctf_test:bots/learn_decay {pct: 95}
$scoreboard players set Bots_decay settings $(pct)
execute unless score Bots_decay settings matches 0..100 run scoreboard players set Bots_decay settings 100
tellraw @s [{"text": "Bot learning: old counts x ", "color": "green"}, {"score": {"name": "Bots_decay", "objective": "settings"}, "color": "white"}, {"text": "% once a match (100: never forget)", "color": "green"}]
