# 1 - primary weapon
execute if items entity @s hotbar.0 * unless items entity @s hotbar.0 *[custom_data~{tags:["main weapon"]}] run function ctf_inv:api/stash {slot: "hotbar.0"}
# 2 - secondary weapon
execute if items entity @s hotbar.1 * unless items entity @s hotbar.1 *[custom_data~{tags:["secondary weapon"]}] run function ctf_inv:api/stash {slot: "hotbar.1"}
# 3 - grenade
execute if items entity @s hotbar.2 * unless items entity @s hotbar.2 *[custom_data~{tags:["he_grenade"]}] run function ctf_inv:api/stash {slot: "hotbar.2"}
# 4-6 - anything that isn't bound to its own slot
execute if items entity @s hotbar.3 #ctf_inv:bound run function ctf_inv:api/stash {slot: "hotbar.3"}
execute if items entity @s hotbar.3 *[custom_data~{bind:1b}] run function ctf_inv:api/stash {slot: "hotbar.3"}
execute if items entity @s hotbar.4 #ctf_inv:bound run function ctf_inv:api/stash {slot: "hotbar.4"}
execute if items entity @s hotbar.4 *[custom_data~{bind:1b}] run function ctf_inv:api/stash {slot: "hotbar.4"}
execute if items entity @s hotbar.5 #ctf_inv:bound run function ctf_inv:api/stash {slot: "hotbar.5"}
execute if items entity @s hotbar.5 *[custom_data~{bind:1b}] run function ctf_inv:api/stash {slot: "hotbar.5"}
# 7 - arrows
execute if items entity @s hotbar.6 * unless items entity @s hotbar.6 arrow run function ctf_inv:api/stash {slot: "hotbar.6"}
# 8 - stick (attack) / flag
execute if items entity @s hotbar.7 * unless items entity @s hotbar.7 #ctf_inv:flag_slot run function ctf_inv:api/stash {slot: "hotbar.7"}
# 9 - ultimate
execute if items entity @s hotbar.8 * unless items entity @s hotbar.8 carrot_on_a_stick[custom_data~{action:"ultimate"}] run function ctf_inv:api/stash {slot: "hotbar.8"}
# Offhand
execute if items entity @s weapon.offhand * unless items entity @s weapon.offhand #ctf_inv:offhand run function ctf_inv:api/stash {slot: "weapon.offhand"}
