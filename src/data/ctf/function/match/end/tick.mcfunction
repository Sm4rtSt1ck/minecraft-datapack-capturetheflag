scoreboard players remove end timer 1
execute store result bossbar ctf:match value run scoreboard players get end timer

# Exit button in the crafting grid
execute as @a[tag=player] run function ctf_inv:exit/tick
execute as @e[type=item, tag=!ctf.seen] run function ctf_inv:ground/classify

execute if score end timer matches -2147483648..0 run function ctf:match/end/end
