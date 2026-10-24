# Loss bonus = base + step * (losses in a row - 1), the streak is capped
$scoreboard players add #streak.$(side) econ 1
$execute if score #streak.$(side) econ > #loss.max_streak econ run scoreboard players operation #streak.$(side) econ = #loss.max_streak econ

$scoreboard players operation #amount econ = #streak.$(side) econ
scoreboard players remove #amount econ 1
scoreboard players operation #amount econ *= #loss.step econ
scoreboard players operation #amount econ += #loss.base econ

$execute as @a[tag=player, tag=$(side)] run function ctf_econ:round/loss {side: "$(side)"}
