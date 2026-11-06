# The projectile (entity type, tag) next to the marker bot_vec flies towards it: its Motion =
# (marker - projectile) in thousandths x speed. The marker is removed
$execute store result score #x1 bots run data get entity @n[type=$(entity), tag=$(tag)] Pos[0] 1000
$execute store result score #y1 bots run data get entity @n[type=$(entity), tag=$(tag)] Pos[1] 1000
$execute store result score #z1 bots run data get entity @n[type=$(entity), tag=$(tag)] Pos[2] 1000
execute store result score #x2 bots run data get entity @n[type=marker, tag=bot_vec] Pos[0] 1000
execute store result score #y2 bots run data get entity @n[type=marker, tag=bot_vec] Pos[1] 1000
execute store result score #z2 bots run data get entity @n[type=marker, tag=bot_vec] Pos[2] 1000
scoreboard players operation #x2 bots -= #x1 bots
scoreboard players operation #y2 bots -= #y1 bots
scoreboard players operation #z2 bots -= #z1 bots
$execute store result entity @n[type=$(entity), tag=$(tag)] Motion[0] double $(speed) run scoreboard players get #x2 bots
$execute store result entity @n[type=$(entity), tag=$(tag)] Motion[1] double $(speed) run scoreboard players get #y2 bots
$execute store result entity @n[type=$(entity), tag=$(tag)] Motion[2] double $(speed) run scoreboard players get #z2 bots
kill @e[type=marker, tag=bot_vec]
