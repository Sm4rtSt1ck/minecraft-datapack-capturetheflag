# Simple purchase. Returns 1 on success, 0 otherwise.
# item, name, components (custom_data included), count, cost
# offhand: 1 - goes into the offhand if it's empty
$execute unless score @s money matches $(cost).. run return run function ctf_shop:feedback/no_money
$execute store result score #ok shop.tmp run function ctf_shop:internal/space {offhand: $(offhand), free: 1}
execute if score #ok shop.tmp matches 0 run return run function ctf_shop:feedback/no_space

$execute if score #off shop.tmp matches 1 run item replace entity @s weapon.offhand with $(item)[custom_name='$(name)', $(components)] $(count)
$execute if score #off shop.tmp matches 0 run give @s $(item)[custom_name='$(name)', $(components)] $(count)
$scoreboard players remove @s money $(cost)
function ctf_shop:feedback/bought
return 1
