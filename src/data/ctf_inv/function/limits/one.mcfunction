# Drops everything above max at the player's feet. pred, max
$function ctf_inv:limits/count {pred: '$(pred)'}
$scoreboard players remove #n inv.tmp $(max)
execute if score #n inv.tmp matches ..0 run return 0
execute store result storage ctf_inv:tmp lim.n int 1 run scoreboard players get #n inv.tmp
$data modify storage ctf_inv:tmp lim.pred set value '$(pred)'
function ctf_inv:limits/drop with storage ctf_inv:tmp lim
