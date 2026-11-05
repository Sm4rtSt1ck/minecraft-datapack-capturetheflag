# admin:build/bots/dump: the route points number #k, each to its route; then the next number
execute as @e[type=armor_stand, tag=build_route] if score @s build.idx = #k solid.tmp run function admin:build/bots/internal/route_point
scoreboard players add #k solid.tmp 1
execute if score #k solid.tmp <= #max solid.tmp run function admin:build/bots/internal/route_step
