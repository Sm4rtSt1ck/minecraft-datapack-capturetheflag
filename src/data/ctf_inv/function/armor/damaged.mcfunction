# 1 if a piece of the worn body armor set is damaged (a set is bought again only then)
execute if items entity @s armor.chest *[damage~{damage:{min:1}}] run return 1
execute if items entity @s armor.legs *[custom_data~{ctf_part:1b}, damage~{damage:{min:1}}] run return 1
execute if items entity @s armor.feet *[custom_data~{ctf_part:1b}, damage~{damage:{min:1}}] run return 1
return 0
