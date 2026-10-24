# #ctf:tick/freeze, #ctf:tick/round, #ctf:tick/end_round
# Exit button in the crafting grid
execute as @a[tag=player, gamemode=!spectator] run function ctf_inv:exit/tick

# Hotbar layout and items on the ground
function ctf_inv:tick
