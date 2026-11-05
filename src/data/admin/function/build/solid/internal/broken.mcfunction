# admin:tick, at a creative player: a solid display whose barrier is gone (broken by hand) is removed.
# Only near the player (creative reach is 5 blocks): the displays of far chunks are not checked.
execute as @e[type=block_display, tag=ctf_solid, distance=..8] at @s unless block ~ ~ ~ barrier run kill @s
