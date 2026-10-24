# #ctf:tick/end
# Exit button in the crafting grid
execute as @a[tag=player] run function ctf_inv:exit/tick
execute as @e[type=item, tag=!ctf.seen] run function ctf_inv:ground/classify
