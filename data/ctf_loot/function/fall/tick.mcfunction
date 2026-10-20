# Runs every tick as a falling crate marker. It is moved with tp, so it flies through any blocks
# (invisible ceilings too). Accelerating fall: exactly 30 blocks in 30 ticks.
scoreboard players add @s loot.t 1
function ctf_loot:fall/particles with entity @s data.r
execute if score @s loot.t matches 1 run tp @s ~ ~-0.0333 ~
execute if score @s loot.t matches 2 run tp @s ~ ~-0.1000 ~
execute if score @s loot.t matches 3 run tp @s ~ ~-0.1667 ~
execute if score @s loot.t matches 4 run tp @s ~ ~-0.2333 ~
execute if score @s loot.t matches 5 run tp @s ~ ~-0.3000 ~
execute if score @s loot.t matches 6 run tp @s ~ ~-0.3667 ~
execute if score @s loot.t matches 7 run tp @s ~ ~-0.4333 ~
execute if score @s loot.t matches 8 run tp @s ~ ~-0.5000 ~
execute if score @s loot.t matches 9 run tp @s ~ ~-0.5667 ~
execute if score @s loot.t matches 10 run tp @s ~ ~-0.6333 ~
execute if score @s loot.t matches 11 run tp @s ~ ~-0.7000 ~
execute if score @s loot.t matches 12 run tp @s ~ ~-0.7667 ~
execute if score @s loot.t matches 13 run tp @s ~ ~-0.8333 ~
execute if score @s loot.t matches 14 run tp @s ~ ~-0.9000 ~
execute if score @s loot.t matches 15 run tp @s ~ ~-0.9667 ~
execute if score @s loot.t matches 16 run tp @s ~ ~-1.0333 ~
execute if score @s loot.t matches 17 run tp @s ~ ~-1.1000 ~
execute if score @s loot.t matches 18 run tp @s ~ ~-1.1667 ~
execute if score @s loot.t matches 19 run tp @s ~ ~-1.2333 ~
execute if score @s loot.t matches 20 run tp @s ~ ~-1.3000 ~
execute if score @s loot.t matches 21 run tp @s ~ ~-1.3667 ~
execute if score @s loot.t matches 22 run tp @s ~ ~-1.4333 ~
execute if score @s loot.t matches 23 run tp @s ~ ~-1.5000 ~
execute if score @s loot.t matches 24 run tp @s ~ ~-1.5667 ~
execute if score @s loot.t matches 25 run tp @s ~ ~-1.6333 ~
execute if score @s loot.t matches 26 run tp @s ~ ~-1.7000 ~
execute if score @s loot.t matches 27 run tp @s ~ ~-1.7667 ~
execute if score @s loot.t matches 28 run tp @s ~ ~-1.8333 ~
execute if score @s loot.t matches 29 run tp @s ~ ~-1.9000 ~
execute if score @s loot.t matches 30 run tp @s ~ ~-1.9667 ~
execute if score @s loot.t matches 30.. run function ctf_loot:fall/land
