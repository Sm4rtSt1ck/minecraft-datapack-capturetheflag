# Still aiming
execute if score @s sn.seen matches 1 run return run scoreboard players set @s sn.seen 0

# Stopped aiming: shoot (or cancel), then reset
function ctf_sniper:internal/release
scoreboard players set @s sn.aim 0
