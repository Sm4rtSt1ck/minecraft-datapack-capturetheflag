# Round rewards. winner / loser: "attack" or "defense"
# #reason econ.tmp: 1 flag delivered, 2 flag not placed, 3 attackers eliminated, 4 time is over
$execute as @a[tag=player, tag=$(winner)] run function ctf_econ:round/win
$function ctf_econ:round/loss_side {side: "$(loser)"}

# Loss streaks: the winner's counter goes down by one
$execute if score #streak.$(winner) econ matches 1.. run scoreboard players remove #streak.$(winner) econ 1
