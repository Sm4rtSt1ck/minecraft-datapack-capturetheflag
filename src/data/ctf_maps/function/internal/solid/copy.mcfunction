# The map clone (ctf_maps:map/<map>/clone), as an unbreakable block display of the template (tag
# ctf_solid, admin:build/solid), positioned at its place in the arena: the copy is a map entity
# (killed at the next clone) and is not copied again
data modify storage ctf_maps:solid state set from entity @s block_state
summon block_display ~ ~ ~ {Tags: ["map_entity", "ctf_solid_new"]}
execute as @n[type=block_display, tag=ctf_solid_new, distance=..0.01] run function ctf_maps:internal/solid/look
