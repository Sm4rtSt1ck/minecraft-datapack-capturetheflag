# Limited: 3 per round (see ctf_shop:limits/check). Keep the cost in sync with render.mcfunction
# The item itself comes from ctf_inv:give/chorus (the only chorus item of the game)
execute unless function ctf_shop:limits/chorus run return 0
execute unless score @s money matches 40.. run return run function ctf_shop:feedback/no_money
execute store result score #ok shop.tmp run function ctf_shop:internal/space {offhand: 0, free: 1}
execute if score #ok shop.tmp matches 0 run return run function ctf_shop:feedback/no_space

function ctf_inv:give/chorus {count: 1}
scoreboard players remove @s money 40
scoreboard players add @s shop.lim.chorus 1
function ctf_shop:feedback/bought
return 1
