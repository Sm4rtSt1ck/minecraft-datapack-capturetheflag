# Runs as a player next to a trap. If he is an attacker, he gets the kill credit of the trap
# (kills of defenders by it: money, and the loot crate task "enemy_trap"). trap
$execute if entity @s[tag=attack] run scoreboard players operation @e[type=frog, tag=trap.$(trap), tag=trap_marker, distance=..2] kc.owner = @s player_id
$execute as @e[type=frog, tag=trap.$(trap), tag=trap_marker, distance=..2] run function ctf:match/events/traps/$(trap)/trigger
