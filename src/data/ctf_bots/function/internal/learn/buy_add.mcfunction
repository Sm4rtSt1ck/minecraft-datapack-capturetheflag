# One more of $(id) in the purchase context $(ctx) (n: rounds of the context)
$execute store result score #n lrn run data get storage ctf_bots:learn buy.c$(ctx).$(id)
scoreboard players add #n lrn 1
$execute store result storage ctf_bots:learn buy.c$(ctx).$(id) int 1 run scoreboard players get #n lrn
