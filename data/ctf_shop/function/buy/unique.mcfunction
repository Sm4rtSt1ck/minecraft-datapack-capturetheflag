# Only one per round for the whole server (traps). Counter: <key> bought.item
# item, name, components, count, cost, key, title
$execute unless score @s money matches $(cost).. run return run function ctf_shop:feedback/no_money
$execute if score $(key) bought.item matches 1.. run return run function ctf_shop:feedback/unique {title: "$(title)"}
execute store result score #ok shop.tmp run function ctf_shop:internal/space {offhand: 0, free: 1}
execute if score #ok shop.tmp matches 0 run return run function ctf_shop:feedback/no_space

$give @s $(item)[custom_name='$(name)', $(components)] $(count)
$scoreboard players remove @s money $(cost)
$scoreboard players add $(key) bought.item 1
function ctf_shop:feedback/bought
return 1
