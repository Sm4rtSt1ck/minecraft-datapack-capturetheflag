# The bomber explodes (timer over, round over or he was killed). Runs as the bomber, at his position.
# Only in the match (not when he leaves to the lobby or the teams are swapped)
execute unless score game state = round state unless score game state = end_round state run return 0

clear @s tnt
particle minecraft:campfire_cosy_smoke ~ ~ ~ 0 0 0 0.5 200 normal @a[tag=!lobby]
summon creeper ~ ~ ~ {ExplosionRadius: 4, Fuse: 0}

# A real death: the game drops his inventory (nothing is kept for the next round) and
# ctf:match/events/fight/die runs as for any other death. If he was killed, he is already dead.
execute unless entity @s[gamemode=spectator] run kill @s
