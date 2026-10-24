# Body armor set (ctf_inv:armor) + team leather helmet. cost, material, max (durability)
$execute unless score @s money matches $(cost).. run return run function ctf_shop:feedback/no_money

item replace entity @s[tag=attack] armor.head with leather_helmet[minecraft:dyed_color={rgb:16711799}]
item replace entity @s[tag=defense] armor.head with leather_helmet[minecraft:dyed_color={rgb:47103}]
$function ctf_inv:armor/equip_set {mat: "$(material)", max: $(max), extra: "", feet: "$(material)_boots", feet_extra: "enchantments={feather_falling:1}, "}
function ctf_inv:armor/sound

$scoreboard players remove @s money $(cost)
function ctf_shop:feedback/bought
return 1
