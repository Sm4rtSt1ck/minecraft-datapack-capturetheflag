scoreboard players set @s timer 300


function ctf:match/helpers/save_inventory
clear @s

weather thunder

give @s minecraft:trident[custom_data={tags:["ultimate"]}, entity_data={id: "trident", Tags: ["ultimate"]}, enchantments={levels:{loyalty:20, channeling:127}}]
item replace entity @s armor.head with diamond_helmet[custom_data={tags:["ultimate"]}, enchantments={thorns:10}]
item replace entity @s armor.chest with diamond_chestplate[custom_data={tags:["ultimate"]}, enchantments={thorns:10}]
item replace entity @s armor.legs with diamond_leggings[custom_data={tags:["ultimate"]}, enchantments={thorns:10}]
item replace entity @s armor.feet with diamond_boots[custom_data={tags:["ultimate"]}, enchantments={thorns:10}]
