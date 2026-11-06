# As a teammate below the flag carrier (@n bot_carrier): its way to the delivery point shorter (#cp bots:
# the carrier's minus PASS "gain") and the carrier sees it (ctf_bots:internal/team/pass_ray)? It gets bot_rcv
execute at @n[type=armor_stand, tag=win_trigger] run function ctf_bots:internal/team/path
execute unless score #path bots <= #cp bots run return 0
tag @s add bot_rcvc
scoreboard players set #los bots 0
scoreboard players set #step bots 0
execute as @n[type=zombified_piglin, tag=bot_carrier] at @s anchored eyes facing entity @n[type=zombified_piglin, tag=bot_rcvc] eyes positioned ^ ^ ^1 run function ctf_bots:internal/team/pass_ray
tag @s remove bot_rcvc
execute if score #los bots matches 1 run tag @s add bot_rcv
