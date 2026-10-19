# "Less fall damage": the boots of the worn armor set become leather boots with Feather Falling III
# (same durability as the set, they still break together with it). cost
$execute unless score @s money matches $(cost).. run return run function ctf_shop:feedback/no_money
execute unless items entity @s armor.chest *[custom_data~{ctf_set:{}}] run return run tellraw @s {"text": "Put on your body armor first!", "color": "red"}
execute if items entity @s armor.chest *[custom_data~{ctf_set:{ff3:1b}}] run return run tellraw @s {"text": "You already have these boots!", "color": "red"}

item modify entity @s armor.chest {function: "minecraft:set_custom_data", tag: "{ctf_set:{feet:'leather_boots', feet_extra:'enchantments={levels:{feather_falling:3}}, ', ff3:1b}}"}
function ctf_inv:armor/reassemble

$scoreboard players remove @s money $(cost)
function ctf_shop:feedback/bought
return 1
