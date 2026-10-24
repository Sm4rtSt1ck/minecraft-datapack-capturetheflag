# Start of freeze: a player without body armor (worn or in the inventory) gets the team leather set
execute if items entity @s armor.chest *[custom_data~{ctf_set:{}}] run return 0
execute if items entity @s container.* *[custom_data~{ctf_set:{}}] run return 0
execute if entity @s[tag=attack] run return run function ctf_inv:armor/equip_set {mat: "leather", max: 80, extra: "dyed_color={rgb:16711799}, ", feet: "leather_boots", feet_extra: "dyed_color={rgb:16711799}, enchantments={feather_falling:1}, "}
execute if entity @s[tag=defense] run function ctf_inv:armor/equip_set {mat: "leather", max: 80, extra: "dyed_color={rgb:47103}, ", feet: "leather_boots", feet_extra: "dyed_color={rgb:47103}, enchantments={feather_falling:1}, "}
