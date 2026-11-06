# A step of 1 block of the ray from the carrier's eyes to the teammate tagged bot_rcvc (see-through
# blocks pass): reached (within 1 of its eyes) -> #los bots 1
execute positioned ~ ~-1.5 ~ if entity @e[type=zombified_piglin, tag=bot_rcvc, distance=..1] run return run scoreboard players set #los bots 1
execute unless block ~ ~ ~ #ctf_bots:see run return 0
scoreboard players add #step bots 1
execute if score #step bots matches 40.. run return 0
execute positioned ^ ^ ^1 run function ctf_bots:internal/team/pass_ray
