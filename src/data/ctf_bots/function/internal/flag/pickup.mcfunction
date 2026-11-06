# An attack bot picks the flag up from the ground: it carries it (glowing like a player with the
# flag); its position is followed (dropped there if it dies: ctf_bots:tick/combat)
kill @n[type=item, tag=bot_flag_item, distance=..1.5]
tag @s add bot_carrier
effect give @s minecraft:glowing infinite 0 true
summon marker ~ ~ ~ {Tags: ["bot_flag_pos"]}
