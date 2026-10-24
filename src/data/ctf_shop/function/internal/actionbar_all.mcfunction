from registry:shop import PAGES
scoreboard players set #clock shop.tmp 0
execute as @a[tag=player, scores={shop_category=(f"1..{len(PAGES)}")}] run function ctf_shop:ui/actionbar
