# The markers of a kind glow when its egg is held (#held_<id>), else not; the state is remembered
$execute if score #held_$(id) solid.tmp matches 1 as @e[type=armor_stand, tag=$(tag)] run data merge entity @s {Glowing: 1b}
$execute if score #held_$(id) solid.tmp matches 0 as @e[type=armor_stand, tag=$(tag)] run data merge entity @s {Glowing: 0b}
$scoreboard players operation #glow_$(id) solid.tmp = #held_$(id) solid.tmp
