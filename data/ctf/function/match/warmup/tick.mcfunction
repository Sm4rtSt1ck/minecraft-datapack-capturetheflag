scoreboard players remove warmup timer 1
execute store result bossbar ctf:match value run scoreboard players get warmup timer

execute if score warmup timer matches 60 run title @a[tag=player] title {"text":"3", "color":"green"}
execute if score warmup timer matches 40 run title @a[tag=player] title {"text":"2", "color":"green"}
execute if score warmup timer matches 20 run title @a[tag=player] title {"text":"1", "color":"green"}

execute if score warmup timer matches -2147483648..0 run function ctf:match/warmup/end
