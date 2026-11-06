# A step of the falling anvil (a quarter of a block) while it has speed left (#left trap.v); a block
# under it that stops it: landed (ctf_traps:internal/anvil/land)
execute unless block ~0.5 ~-0.25 ~0.5 #ctf_guns:passable run return run function ctf_traps:internal/anvil/land
tp @s ~ ~-0.25 ~
scoreboard players add @s trap.d 250
scoreboard players remove #left trap.v 250
execute if score #left trap.v matches 250.. positioned ~ ~-0.25 ~ run function ctf_traps:internal/anvil/step
