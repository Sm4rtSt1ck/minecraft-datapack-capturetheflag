# A bot's purchase $(id) in the context $(ctx) gave $(v): counted (buyb.c<ctx>.<id>: n, v)
$execute store result score #n lrn run data get storage ctf_bots:learn buyb.c$(ctx).$(id).n
scoreboard players add #n lrn 1
$execute store result storage ctf_bots:learn buyb.c$(ctx).$(id).n int 1 run scoreboard players get #n lrn
$execute store result score #n lrn run data get storage ctf_bots:learn buyb.c$(ctx).$(id).v
$scoreboard players add #n lrn $(v)
$execute store result storage ctf_bots:learn buyb.c$(ctx).$(id).v int 1 run scoreboard players get #n lrn
