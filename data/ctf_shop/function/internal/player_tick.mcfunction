# Fast path: 27 UI items in slots 9-35 means nothing has changed
execute store result score @s shop.n if items entity @s inventory.* *[custom_data~{ctf_ui:{}}]
execute unless score @s shop.n matches 27 run function ctf_shop:internal/on_change
