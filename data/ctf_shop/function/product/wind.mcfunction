# Wind charges: up to 5 per purchase, at most 10 in the inventory. $24 each
# (keep the price in sync with render.mcfunction: 5 x 24 = 120)
function ctf_inv:limits/count {pred: 'wind_charge'}
scoreboard players set #k shop.tmp 10
scoreboard players operation #k shop.tmp -= #n inv.tmp
execute if score #k shop.tmp matches 6.. run scoreboard players set #k shop.tmp 5
execute if score #k shop.tmp matches ..0 run return run function ctf_shop:feedback/wind_limit

scoreboard players operation #c shop.tmp = #k shop.tmp
scoreboard players set #p shop.tmp 24
scoreboard players operation #c shop.tmp *= #p shop.tmp
execute unless score @s money >= #c shop.tmp run return run function ctf_shop:feedback/no_money
execute if score #n inv.tmp matches ..0 if items entity @s weapon.offhand * unless function ctf_inv:api/has_free_slot run return run function ctf_shop:feedback/no_space

execute store result storage ctf_shop:tmp wind.count int 1 run scoreboard players get #k shop.tmp
function ctf_inv:give/wind with storage ctf_shop:tmp wind
scoreboard players operation @s money -= #c shop.tmp
function ctf_shop:feedback/bought
return 1
