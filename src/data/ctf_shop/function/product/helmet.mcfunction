# Team leather helmet (the same as with the armor sets). cost
$execute unless score @s money matches $(cost).. run return run function ctf_shop:feedback/no_money
execute if items entity @s armor.head * run return run tellraw @s {"text": "You already have a helmet!", "color": "red"}

item replace entity @s[tag=attack] armor.head with leather_helmet[minecraft:dyed_color={rgb:16711799}]
item replace entity @s[tag=defense] armor.head with leather_helmet[minecraft:dyed_color={rgb:47103}]
function ctf_inv:armor/sound

$scoreboard players remove @s money $(cost)
function ctf_shop:feedback/bought
return 1
