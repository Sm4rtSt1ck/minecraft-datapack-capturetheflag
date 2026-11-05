# A step of 0.1 block on the line of sight (#r steps left): the new barrier gets its display
execute if block ~ ~ ~ barrier align xyz unless entity @e[type=block_display, tag=ctf_solid, distance=..0.01] run return run function admin:build/solid/internal/block_here
scoreboard players remove #r solid.tmp 1
execute if score #r solid.tmp matches 1.. positioned ^ ^ ^0.1 run function admin:build/solid/internal/look_for
