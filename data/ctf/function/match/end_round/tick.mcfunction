scoreboard players remove end_round timer 1
execute store result bossbar ctf:match value run scoreboard players get end_round timer


execute if score end_round timer matches -2147483648..0 run function ctf:match/end_round/end
