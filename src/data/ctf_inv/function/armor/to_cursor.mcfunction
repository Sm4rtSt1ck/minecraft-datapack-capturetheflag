clear @s *[custom_data~{ctf_part:1b}]
scoreboard players reset @s arm.sid
item replace entity @s player.cursor from entity @s armor.chest
item replace entity @s armor.chest with air
