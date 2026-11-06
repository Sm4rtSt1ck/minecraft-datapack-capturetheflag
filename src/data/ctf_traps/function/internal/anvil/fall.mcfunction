# Every tick, as a falling anvil (ctf_traps:internal/anvil/trigger), at its lower corner: it falls like
# the falling block it replaces (+0.04 blocks a tick of speed, then a drag of 0.98) through the blocks
# that don't stop a bullet (#ctf_guns:passable: air, ladders, plants...), a quarter of a block a step
scoreboard players add @s trap.v 40
scoreboard players operation #left trap.v = @s trap.v
function ctf_traps:internal/anvil/step
scoreboard players operation @s trap.v *= #98 trap.v
scoreboard players operation @s trap.v /= #100 trap.v
# Fallen out of the world
execute if score @s trap.d matches 100000.. run kill @s
