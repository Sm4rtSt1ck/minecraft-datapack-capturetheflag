# 1 if one more item can be bought: (carried at freeze start + bought) < max and carried now < max
# key, pred, max, name
$execute if score @s shop.lim.$(key) matches $(max).. run return run function ctf_shop:feedback/round_limit {max: $(max), name: "$(name)"}
$function ctf_inv:limits/count {pred: '$(pred)'}
$execute if score #n inv.tmp matches $(max).. run return run function ctf_shop:feedback/round_limit {max: $(max), name: "$(name)"}
return 1
