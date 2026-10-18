execute unless items entity @s player.crafting.0 *[custom_data~{ctf_craft:{}}] run function ctf_inv:api/stash {slot: "player.crafting.0"}
execute unless items entity @s player.crafting.1 *[custom_data~{ctf_craft:{}}] run function ctf_inv:api/stash {slot: "player.crafting.1"}
execute unless items entity @s player.crafting.2 *[custom_data~{ctf_craft:{}}] run function ctf_inv:api/stash {slot: "player.crafting.2"}
execute unless items entity @s player.crafting.3 *[custom_data~{ctf_craft:{}}] run function ctf_inv:api/stash {slot: "player.crafting.3"}
execute if entity @e[type=item, tag=ctf.buf, limit=1] run function ctf_inv:api/place
