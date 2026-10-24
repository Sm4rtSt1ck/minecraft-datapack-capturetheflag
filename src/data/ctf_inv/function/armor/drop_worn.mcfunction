# Before a new set is put on: the worn set is dropped at the player's feet.
# The default leather set (everyone gets it, ctf_inv:armor/freeze_default) is just replaced
execute unless items entity @s armor.chest *[custom_data~{ctf_set:{}}] run return 0
execute if items entity @s armor.chest *[custom_data~{ctf_set:{mat:"leather"}}] run return 0
function ctf_inv:armor/drop_set
