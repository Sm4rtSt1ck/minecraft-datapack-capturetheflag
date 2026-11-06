# Down a ladder (or the air under it) to the floor, then a walk to B: a ladder link down (6)
scoreboard players add #lh nav 1
execute if score #lh nav matches 64.. run return 0
execute if block ~ ~-1 ~ #ctf_bots:gap positioned ~ ~-1 ~ run return run function ctf_bots:internal/nav/climb_down
function ctf_bots:internal/nav/walk_reset
scoreboard players set #mode nav 1
execute facing entity @e[type=marker, tag=nav_b, limit=1] feet rotated ~ 0 run function ctf_bots:internal/nav/walk
execute if score #ok nav matches 1.. run scoreboard players set #ok nav 6
