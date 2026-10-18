# category, cost
$execute if score @s ultimate_category matches $(category) run return 0
$execute unless score @s money matches $(cost).. run return run function ctf_shop:feedback/no_money

$scoreboard players set @s ultimate_category $(category)
$scoreboard players remove @s money $(cost)
function ctf_inv:give/ultimate
function ctf_shop:feedback/bought
return 1
