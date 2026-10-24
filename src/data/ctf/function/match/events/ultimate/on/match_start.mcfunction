# #ctf:on/match_start
scoreboard players set @a[tag=player] ultimate_category 1
execute as @a[tag=player] run function ctf:match/events/ultimate/reset_value
