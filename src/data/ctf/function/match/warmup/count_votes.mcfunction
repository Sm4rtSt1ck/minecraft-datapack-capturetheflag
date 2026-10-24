# #votes - players who voted to skip the warm-up, #need - 2/3 of the players of the match, rounded up.
# Run at the start of the warm-up, on a vote and when the number of players changes
execute store result score #all skip.tmp if entity @a[tag=player]
execute store result score #votes skip.tmp if entity @a[tag=player, tag=skip]
scoreboard players operation #need skip.tmp = #all skip.tmp
scoreboard players operation #need skip.tmp *= 2 number
scoreboard players operation #need skip.tmp += 2 number
scoreboard players operation #need skip.tmp /= 3 number

execute if score #votes skip.tmp >= #need skip.tmp run function ctf:match/warmup/skip
