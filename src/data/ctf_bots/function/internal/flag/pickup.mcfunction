# An attack bot picks the flag up from the ground: it carries it (ctf_flag:api/pickup: glowing, like
# a player); its position is followed (dropped there if it dies: ctf_bots:tick/combat)
kill @n[type=item, tag=bot_flag_item, distance=..1.5]
tag @s add bot_carrier
function ctf_flag:api/pickup
summon marker ~ ~ ~ {Tags: ["bot_flag_pos"]}
