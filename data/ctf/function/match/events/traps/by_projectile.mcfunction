# Runs as a projectile next to a trap. If it was shot by an attacker, he gets the kill credit. trap
$execute on origin if entity @s[tag=attack] run scoreboard players operation @e[tag=trap.$(trap), tag=trap_marker, distance=..2] kc.owner = @s player_id
$execute as @e[tag=trap.$(trap), tag=trap_marker, distance=..2] run function ctf:match/events/traps/$(trap)/trigger
