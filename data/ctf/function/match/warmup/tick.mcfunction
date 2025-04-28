scoreboard players remove warmup timer 1
execute store result bossbar ctf:match value run scoreboard players get warmup timer

execute if score warmup timer matches -2147483648..0 run function ctf:match/warmup/end
