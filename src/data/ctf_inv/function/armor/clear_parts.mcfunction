# The set is no longer worn: its id is forgotten, so the chestplate put on again gets new parts
scoreboard players reset @s arm.sid
execute if score #p inv.tmp matches 1.. run clear @s *[custom_data~{ctf_part:1b}]
