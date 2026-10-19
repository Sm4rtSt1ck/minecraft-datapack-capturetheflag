# A picked up helmet / set chestplate is put on if its armor slot is empty
# (only after a pickup: taking the armor off on purpose must still be possible)
execute unless score @s pk.chest_l matches 1.. unless score @s pk.chest_g matches 1.. unless score @s pk.chest_i matches 1.. unless score @s pk.helm_l matches 1.. unless score @s pk.helm_g matches 1.. unless score @s pk.helm_i matches 1.. run return 0
scoreboard players reset @s pk.chest_l
scoreboard players reset @s pk.chest_g
scoreboard players reset @s pk.chest_i
scoreboard players reset @s pk.helm_l
scoreboard players reset @s pk.helm_g
scoreboard players reset @s pk.helm_i

execute unless items entity @s armor.head * if items entity @s hotbar.0 #ctf_inv:helmets run function ctf_inv:armor/move {from: "hotbar.0", to: "armor.head"}
execute unless items entity @s armor.head * if items entity @s hotbar.1 #ctf_inv:helmets run function ctf_inv:armor/move {from: "hotbar.1", to: "armor.head"}
execute unless items entity @s armor.head * if items entity @s hotbar.2 #ctf_inv:helmets run function ctf_inv:armor/move {from: "hotbar.2", to: "armor.head"}
execute unless items entity @s armor.head * if items entity @s hotbar.3 #ctf_inv:helmets run function ctf_inv:armor/move {from: "hotbar.3", to: "armor.head"}
execute unless items entity @s armor.head * if items entity @s hotbar.4 #ctf_inv:helmets run function ctf_inv:armor/move {from: "hotbar.4", to: "armor.head"}
execute unless items entity @s armor.head * if items entity @s hotbar.5 #ctf_inv:helmets run function ctf_inv:armor/move {from: "hotbar.5", to: "armor.head"}
execute unless items entity @s armor.head * if items entity @s hotbar.6 #ctf_inv:helmets run function ctf_inv:armor/move {from: "hotbar.6", to: "armor.head"}
execute unless items entity @s armor.head * if items entity @s hotbar.7 #ctf_inv:helmets run function ctf_inv:armor/move {from: "hotbar.7", to: "armor.head"}
execute unless items entity @s armor.head * if items entity @s hotbar.8 #ctf_inv:helmets run function ctf_inv:armor/move {from: "hotbar.8", to: "armor.head"}
execute unless items entity @s armor.chest * if items entity @s hotbar.0 *[custom_data~{ctf_set:{}}] run function ctf_inv:armor/move {from: "hotbar.0", to: "armor.chest"}
execute unless items entity @s armor.chest * if items entity @s hotbar.1 *[custom_data~{ctf_set:{}}] run function ctf_inv:armor/move {from: "hotbar.1", to: "armor.chest"}
execute unless items entity @s armor.chest * if items entity @s hotbar.2 *[custom_data~{ctf_set:{}}] run function ctf_inv:armor/move {from: "hotbar.2", to: "armor.chest"}
execute unless items entity @s armor.chest * if items entity @s hotbar.3 *[custom_data~{ctf_set:{}}] run function ctf_inv:armor/move {from: "hotbar.3", to: "armor.chest"}
execute unless items entity @s armor.chest * if items entity @s hotbar.4 *[custom_data~{ctf_set:{}}] run function ctf_inv:armor/move {from: "hotbar.4", to: "armor.chest"}
execute unless items entity @s armor.chest * if items entity @s hotbar.5 *[custom_data~{ctf_set:{}}] run function ctf_inv:armor/move {from: "hotbar.5", to: "armor.chest"}
execute unless items entity @s armor.chest * if items entity @s hotbar.6 *[custom_data~{ctf_set:{}}] run function ctf_inv:armor/move {from: "hotbar.6", to: "armor.chest"}
execute unless items entity @s armor.chest * if items entity @s hotbar.7 *[custom_data~{ctf_set:{}}] run function ctf_inv:armor/move {from: "hotbar.7", to: "armor.chest"}
execute unless items entity @s armor.chest * if items entity @s hotbar.8 *[custom_data~{ctf_set:{}}] run function ctf_inv:armor/move {from: "hotbar.8", to: "armor.chest"}
