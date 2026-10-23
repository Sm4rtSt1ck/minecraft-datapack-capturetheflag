# Puts a new body armor set on the player (replaces the worn one).
# The chestplate carries the whole set: ctf_set {mat, extra, feet, feet_extra}; the leggings and
# boots ("parts") are created from it (ctf_inv:armor/assemble) and only exist while it is worn.
#   mat        - leather / golden / iron ...
#   max        - durability of every piece (all three pieces get the same one, so they break together)
#   extra      - extra components of the chestplate and the leggings, ending with ", " (or "")
#   feet       - boots item id; feet_extra - its extra components, ending with ", " (or "")
clear @s *[custom_data~{ctf_part:1b}]
$item replace entity @s armor.chest with minecraft:$(mat)_chestplate[$(extra)max_damage=$(max), custom_data={ctf_set:{mat:"$(mat)", max:$(max), extra:"$(extra)", feet:"$(feet)", feet_extra:"$(feet_extra)"}}]
function ctf_inv:armor/assemble
