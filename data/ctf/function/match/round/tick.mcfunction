scoreboard players remove round timer 1
execute store result bossbar ctf:match value run scoreboard players get round timer


execute if score round timer matches -2147483648..0 run function ctf:match/end_round/start
