tag @s add ctf.arrow
data modify entity @s pickup set value 0b
execute if entity @s[nbt={item: {components: {"minecraft:custom_data": {ammo: "creep"}}}}] run function ctf_loot:reward/creep/arrow
