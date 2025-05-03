scoreboard players remove freeze timer 1
execute store result bossbar ctf:match value run scoreboard players get freeze timer

execute as @a[scores={flag_placed=1..}] run function ctf:match/event/on_place_flag

function ctf:match/freeze/shop

execute if score freeze timer matches -2147483648..0 run function ctf:match/round/start
