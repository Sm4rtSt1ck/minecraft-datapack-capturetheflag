scoreboard players remove end timer 1
execute store result bossbar ctf:match value run scoreboard players get end timer

execute if score end timer matches -2147483648..0 run function ctf:match/end/end
