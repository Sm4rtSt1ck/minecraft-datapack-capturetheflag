# Inventory layout and items on the ground.
# Run once per tick in freeze / round / end_round (after ctf_shop:tick).

# Items on the ground
function ctf_inv:ground/tick

# Hotbar layout: only for players whose inventory has changed
execute as @a[tag=player, tag=ctf.inv_dirty, gamemode=!spectator] at @s run function ctf_inv:layout/check
