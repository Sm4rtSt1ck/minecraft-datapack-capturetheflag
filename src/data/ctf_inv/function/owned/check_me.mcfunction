# Takes out the loot crate rewards of other players. me
$execute if items entity @s weapon.offhand *[custom_data~{ctf_bound:1b}, !custom_data~{ctf_owner:$(me)}] at @s run function ctf_inv:api/stash {slot: "weapon.offhand"}
$execute if items entity @s player.cursor *[custom_data~{ctf_bound:1b}, !custom_data~{ctf_owner:$(me)}] at @s run function ctf_inv:api/stash {slot: "player.cursor"}
$execute if items entity @s hotbar.0 *[custom_data~{ctf_bound:1b}, !custom_data~{ctf_owner:$(me)}] at @s run function ctf_inv:api/stash {slot: "hotbar.0"}
$execute if items entity @s hotbar.1 *[custom_data~{ctf_bound:1b}, !custom_data~{ctf_owner:$(me)}] at @s run function ctf_inv:api/stash {slot: "hotbar.1"}
$execute if items entity @s hotbar.2 *[custom_data~{ctf_bound:1b}, !custom_data~{ctf_owner:$(me)}] at @s run function ctf_inv:api/stash {slot: "hotbar.2"}
$execute if items entity @s hotbar.3 *[custom_data~{ctf_bound:1b}, !custom_data~{ctf_owner:$(me)}] at @s run function ctf_inv:api/stash {slot: "hotbar.3"}
$execute if items entity @s hotbar.4 *[custom_data~{ctf_bound:1b}, !custom_data~{ctf_owner:$(me)}] at @s run function ctf_inv:api/stash {slot: "hotbar.4"}
$execute if items entity @s hotbar.5 *[custom_data~{ctf_bound:1b}, !custom_data~{ctf_owner:$(me)}] at @s run function ctf_inv:api/stash {slot: "hotbar.5"}
$execute if items entity @s hotbar.6 *[custom_data~{ctf_bound:1b}, !custom_data~{ctf_owner:$(me)}] at @s run function ctf_inv:api/stash {slot: "hotbar.6"}
$execute if items entity @s hotbar.7 *[custom_data~{ctf_bound:1b}, !custom_data~{ctf_owner:$(me)}] at @s run function ctf_inv:api/stash {slot: "hotbar.7"}
$execute if items entity @s hotbar.8 *[custom_data~{ctf_bound:1b}, !custom_data~{ctf_owner:$(me)}] at @s run function ctf_inv:api/stash {slot: "hotbar.8"}
