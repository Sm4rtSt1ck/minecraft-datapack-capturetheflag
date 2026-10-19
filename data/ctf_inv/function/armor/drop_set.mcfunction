# The whole set is dropped (as one chestplate)
clear @s *[custom_data~{ctf_part:1b}]
function ctf_inv:api/stash {slot: "armor.chest"}
tag @s add ctf.stash_owner
execute as @e[type=item, tag=ctf.buf] run function ctf_inv:stash/drop
tag @s remove ctf.stash_owner
