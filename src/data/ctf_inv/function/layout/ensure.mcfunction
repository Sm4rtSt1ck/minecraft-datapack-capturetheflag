# Flag breaker: attackers have it until the flag is broken, defenders never.
# The flag always wins slot 8 over the stick.
execute if entity @s[tag=attack] unless function ctf_inv:api/flag_broken unless function ctf_inv:api/has_flag unless items entity @s hotbar.7 stick run function ctf_inv:give/stick
execute if entity @s[tag=defense] if items entity @s hotbar.7 stick run item replace entity @s hotbar.7 with air
execute if items entity @s hotbar.7 stick if function ctf_inv:api/flag_broken run item replace entity @s hotbar.7 with air

# Ultimate: always in slot 9
execute unless items entity @s hotbar.8 carrot_on_a_stick[custom_data~{action:"ultimate"}] run function ctf_inv:give/ultimate
