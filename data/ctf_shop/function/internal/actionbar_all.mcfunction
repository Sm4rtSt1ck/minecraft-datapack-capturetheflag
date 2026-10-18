scoreboard players set #clock shop.tmp 0
execute as @a[tag=player, scores={shop_category=1..5}] run function ctf_shop:ui/actionbar
