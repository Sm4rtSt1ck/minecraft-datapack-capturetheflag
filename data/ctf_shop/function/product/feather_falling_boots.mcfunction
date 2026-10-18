$execute unless score @s money matches $(cost).. run return run function ctf_shop:feedback/no_money

item replace entity @s armor.feet with minecraft:leather_boots[enchantments={levels:{feather_falling:3}}, custom_name='"Less fall damage"']

$scoreboard players remove @s money $(cost)
function ctf_shop:feedback/bought
return 1
