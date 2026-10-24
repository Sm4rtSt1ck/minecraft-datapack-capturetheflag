# Body armor set (ctf_inv:armor), without the helmet (ctf_shop:product/helmet). cost, material, max (durability)
$execute unless score @s money matches $(cost).. run return run function ctf_shop:feedback/no_money
# The same set is bought again only if it is damaged
$execute if items entity @s armor.chest *[custom_data~{ctf_set:{mat:"$(material)"}}] unless function ctf_inv:armor/damaged run return run tellraw @s {"text": "You already have this armor!", "color": "red"}

# The worn set is dropped (the default leather one is just replaced), the new one is put on
function ctf_inv:armor/drop_worn
$function ctf_inv:armor/equip_set {mat: "$(material)", max: $(max), extra: "", feet: "$(material)_boots", feet_extra: "enchantments={feather_falling:1}, "}
function ctf_inv:armor/sound

$scoreboard players remove @s money $(cost)
function ctf_shop:feedback/bought
return 1
