# Category buttons; the active one glints
execute if score @s shop_category matches 1 run function ctf_shop:ui/button {slot: 9, model: "netherite_sword", name: "WEAPONS", color: "red", glint: true}
execute unless score @s shop_category matches 1 run function ctf_shop:ui/button {slot: 9, model: "netherite_sword", name: "WEAPONS", color: "red", glint: false}
execute if score @s shop_category matches 2 run function ctf_shop:ui/button {slot: 11, model: "netherite_chestplate", name: "DEFENSE", color: "blue", glint: true}
execute unless score @s shop_category matches 2 run function ctf_shop:ui/button {slot: 11, model: "netherite_chestplate", name: "DEFENSE", color: "blue", glint: false}
execute if score @s shop_category matches 3 run function ctf_shop:ui/button {slot: 13, model: "firework_rocket", name: "STUFF", color: "green", glint: true}
execute unless score @s shop_category matches 3 run function ctf_shop:ui/button {slot: 13, model: "firework_rocket", name: "STUFF", color: "green", glint: false}
execute if score @s shop_category matches 4 run function ctf_shop:ui/button {slot: 15, model: "tnt", name: "TRAPS", color: "gold", glint: true}
execute unless score @s shop_category matches 4 run function ctf_shop:ui/button {slot: 15, model: "tnt", name: "TRAPS", color: "gold", glint: false}
execute if score @s shop_category matches 5 run function ctf_shop:ui/button {slot: 17, model: "blaze_rod", name: "ULTIMATE", color: "light_purple", glint: true}
execute unless score @s shop_category matches 5 run function ctf_shop:ui/button {slot: 17, model: "blaze_rod", name: "ULTIMATE", color: "light_purple", glint: false}
