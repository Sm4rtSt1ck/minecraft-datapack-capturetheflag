# Runs as a dead player (from ctf:match/events/fight/die), when nobody got the vanilla kill credit
scoreboard players operation #by kc.tmp = @s kc.by
scoreboard players operation #src kc.tmp = @s kc.src
tag @s add kc.victim
execute as @a[tag=player] if score @s player_id = #by kc.tmp run function ctf:match/events/credit/award
tag @s remove kc.victim
