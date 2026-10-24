# 1 if the bullet point is inside the collision of the block at this point. Runs only for blocks that
# aren't in #ctf_guns:passable. The position inside the block is checked with shifted points: a point
# moved by d stays in the same block only if it is far enough from the block border (for doors and
# trapdoors: a block of the same state, so the other door of a double door doesn't count).

# Doors: a 3/16 plate; its side depends on facing, open and hinge (like the game's door shape)
execute if block ~ ~ ~ #minecraft:doors[facing=east,open=false] run return run execute positioned ~0.8125 ~ ~ if block ~ ~ ~ #minecraft:doors[facing=east,open=false]
execute if block ~ ~ ~ #minecraft:doors[facing=east,open=true,hinge=right] run return run execute positioned ~ ~ ~-0.8125 if block ~ ~ ~ #minecraft:doors[facing=east,open=true,hinge=right]
execute if block ~ ~ ~ #minecraft:doors[facing=east,open=true,hinge=left] run return run execute positioned ~ ~ ~0.8125 if block ~ ~ ~ #minecraft:doors[facing=east,open=true,hinge=left]
execute if block ~ ~ ~ #minecraft:doors[facing=south,open=false] run return run execute positioned ~ ~ ~0.8125 if block ~ ~ ~ #minecraft:doors[facing=south,open=false]
execute if block ~ ~ ~ #minecraft:doors[facing=south,open=true,hinge=right] run return run execute positioned ~0.8125 ~ ~ if block ~ ~ ~ #minecraft:doors[facing=south,open=true,hinge=right]
execute if block ~ ~ ~ #minecraft:doors[facing=south,open=true,hinge=left] run return run execute positioned ~-0.8125 ~ ~ if block ~ ~ ~ #minecraft:doors[facing=south,open=true,hinge=left]
execute if block ~ ~ ~ #minecraft:doors[facing=west,open=false] run return run execute positioned ~-0.8125 ~ ~ if block ~ ~ ~ #minecraft:doors[facing=west,open=false]
execute if block ~ ~ ~ #minecraft:doors[facing=west,open=true,hinge=right] run return run execute positioned ~ ~ ~0.8125 if block ~ ~ ~ #minecraft:doors[facing=west,open=true,hinge=right]
execute if block ~ ~ ~ #minecraft:doors[facing=west,open=true,hinge=left] run return run execute positioned ~ ~ ~-0.8125 if block ~ ~ ~ #minecraft:doors[facing=west,open=true,hinge=left]
execute if block ~ ~ ~ #minecraft:doors[facing=north,open=false] run return run execute positioned ~ ~ ~-0.8125 if block ~ ~ ~ #minecraft:doors[facing=north,open=false]
execute if block ~ ~ ~ #minecraft:doors[facing=north,open=true,hinge=right] run return run execute positioned ~-0.8125 ~ ~ if block ~ ~ ~ #minecraft:doors[facing=north,open=true,hinge=right]
execute if block ~ ~ ~ #minecraft:doors[facing=north,open=true,hinge=left] run return run execute positioned ~0.8125 ~ ~ if block ~ ~ ~ #minecraft:doors[facing=north,open=true,hinge=left]

# Trapdoors: closed -> the bottom / top plate, open -> a plate on the side it faces
execute if block ~ ~ ~ #minecraft:trapdoors[open=false,half=bottom] run return run execute positioned ~ ~0.8125 ~ if block ~ ~ ~ #minecraft:trapdoors[open=false,half=bottom]
execute if block ~ ~ ~ #minecraft:trapdoors[open=false,half=top] run return run execute positioned ~ ~-0.8125 ~ if block ~ ~ ~ #minecraft:trapdoors[open=false,half=top]
execute if block ~ ~ ~ #minecraft:trapdoors[open=true,facing=north] run return run execute positioned ~ ~ ~-0.8125 if block ~ ~ ~ #minecraft:trapdoors[open=true,facing=north]
execute if block ~ ~ ~ #minecraft:trapdoors[open=true,facing=south] run return run execute positioned ~ ~ ~0.8125 if block ~ ~ ~ #minecraft:trapdoors[open=true,facing=south]
execute if block ~ ~ ~ #minecraft:trapdoors[open=true,facing=west] run return run execute positioned ~-0.8125 ~ ~ if block ~ ~ ~ #minecraft:trapdoors[open=true,facing=west]
execute if block ~ ~ ~ #minecraft:trapdoors[open=true,facing=east] run return run execute positioned ~0.8125 ~ ~ if block ~ ~ ~ #minecraft:trapdoors[open=true,facing=east]

# Fence gates: open -> no collision; closed -> a plate in the middle (z 6..10 / x 6..10 of 16)
execute if block ~ ~ ~ #minecraft:fence_gates[open=true] run return 0
execute if block ~ ~ ~ #minecraft:fence_gates[facing=north] run return run execute positioned ~ ~ ~0.375 if block ~ ~ ~ #minecraft:fence_gates positioned ~ ~ ~-0.75 if block ~ ~ ~ #minecraft:fence_gates
execute if block ~ ~ ~ #minecraft:fence_gates[facing=south] run return run execute positioned ~ ~ ~0.375 if block ~ ~ ~ #minecraft:fence_gates positioned ~ ~ ~-0.75 if block ~ ~ ~ #minecraft:fence_gates
execute if block ~ ~ ~ #minecraft:fence_gates run return run execute positioned ~0.375 ~ ~ if block ~ ~ ~ #minecraft:fence_gates positioned ~-0.75 ~ ~ if block ~ ~ ~ #minecraft:fence_gates

# Slabs: the lower / upper half
execute if block ~ ~ ~ #minecraft:slabs[type=bottom] run return run execute positioned ~ ~0.5 ~ if block ~ ~ ~ #minecraft:slabs[type=bottom]
execute if block ~ ~ ~ #minecraft:slabs[type=top] run return run execute positioned ~ ~-0.5 ~ if block ~ ~ ~ #minecraft:slabs[type=top]

# Beds: 9/16 high
execute if block ~ ~ ~ #minecraft:beds run return run execute positioned ~ ~0.4375 ~ if block ~ ~ ~ #minecraft:beds

# Fences, walls, panes, bars: the post in the middle (a connected line counts as solid)
execute if block ~ ~ ~ #minecraft:fences run return run execute positioned ~0.3 ~ ~ if block ~ ~ ~ #minecraft:fences positioned ~-0.6 ~ ~ if block ~ ~ ~ #minecraft:fences positioned ~0.3 ~ ~0.3 if block ~ ~ ~ #minecraft:fences positioned ~ ~ ~-0.6 if block ~ ~ ~ #minecraft:fences
execute if block ~ ~ ~ #minecraft:walls run return run execute positioned ~0.3 ~ ~ if block ~ ~ ~ #minecraft:walls positioned ~-0.6 ~ ~ if block ~ ~ ~ #minecraft:walls positioned ~0.3 ~ ~0.3 if block ~ ~ ~ #minecraft:walls positioned ~ ~ ~-0.6 if block ~ ~ ~ #minecraft:walls
execute if block ~ ~ ~ #ctf_guns:panes run return run execute positioned ~0.3 ~ ~ if block ~ ~ ~ #ctf_guns:panes positioned ~-0.6 ~ ~ if block ~ ~ ~ #ctf_guns:panes positioned ~0.3 ~ ~0.3 if block ~ ~ ~ #ctf_guns:panes positioned ~ ~ ~-0.6 if block ~ ~ ~ #ctf_guns:panes

# Everything else (full blocks, closed doors, stairs, chests...) stops the bullet
return 1
