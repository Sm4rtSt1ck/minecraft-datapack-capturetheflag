# Runs at an explosion of #owner kc.tmp (grenade, trap, ultimate...): trap markers in the blast
# remember him for a few ticks. If one of them goes off from this explosion (ctf:match/events/traps/hurt),
# the kills of that trap are credited to him (a chain reaction keeps the first owner). r - radius
execute unless score #owner kc.tmp matches -2147483648..2147483647 run return 0
$scoreboard players operation @e[type=frog, tag=trap_marker, tag=!triggered, distance=..$(r)] kc.by = #owner kc.tmp
$scoreboard players set @e[type=frog, tag=trap_marker, tag=!triggered, distance=..$(r)] kc.time 5
