# Full armor set. material: golden / iron / diamond / netherite
$execute unless score @s money matches $(cost).. run return run function ctf_shop:feedback/no_money

$item replace entity @s armor.head with minecraft:$(material)_helmet
$item replace entity @s armor.chest with minecraft:$(material)_chestplate
$item replace entity @s armor.legs with minecraft:$(material)_leggings
$item replace entity @s armor.feet with minecraft:$(material)_boots[enchantments={feather_falling:1}]

$scoreboard players remove @s money $(cost)
function ctf_shop:feedback/bought
return 1
