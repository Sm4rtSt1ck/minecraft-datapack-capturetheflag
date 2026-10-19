# The whole set becomes one chestplate in the inventory (or at the feet if there is no place)
clear @s *[custom_data~{ctf_part:1b}]
function ctf_inv:api/stash {slot: "armor.chest"}
function ctf_inv:api/place
