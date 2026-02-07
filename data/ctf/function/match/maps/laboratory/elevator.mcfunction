# Calculate floor (match_id + rounds + random player kills + random player deaths + random player id)
scoreboard players operation elevator number += match match_id
scoreboard players operation elevator number += match rounds
scoreboard players operation elevator number += @r player_id
scoreboard players operation elevator number += @r kills
scoreboard players operation elevator number += @r deaths
scoreboard players operation elevator number %= 3 number

# First floor
execute if score elevator number matches 0 run effect give @s levitation 4 5 true

# Second floor
execute if score elevator number matches 1 run effect give @s levitation 7 6 true

# Third floor
execute if score elevator number matches 2 run effect give @s levitation 9 6 true