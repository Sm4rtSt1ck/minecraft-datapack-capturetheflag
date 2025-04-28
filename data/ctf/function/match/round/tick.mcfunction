#########################################
# EVENTS

execute as @a[scores={just_killed=1..}] run function ctf:match/event/kill
execute as @a[scores={just_died=1..}] run function ctf:match/event/die

#########################################
# WIN LOGIC



#########################################
# TIMER

scoreboard players remove round timer 1
execute store result bossbar ctf:match value run scoreboard players get round timer
execute if score round timer matches -2147483648..0 run function ctf:match/end_round/start
