# At the corner of the block: the old display goes, then the barrier + a new display (#mode 1) or air
# instead of the barrier (#mode 0)
kill @e[type=block_display, tag=ctf_solid, distance=..0.01]
execute if score #mode solid.tmp matches 0 if block ~ ~ ~ barrier run setblock ~ ~ ~ air
execute if score #mode solid.tmp matches 0 run return 0
setblock ~ ~ ~ barrier
summon block_display ~ ~ ~ {Tags: ["ctf_solid", "ctf_solid_new"]}
execute as @n[type=block_display, tag=ctf_solid_new, distance=..0.01] run function admin:build/solid/internal/look
