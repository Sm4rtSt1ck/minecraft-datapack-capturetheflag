scoreboard players reset @s just_used_chorus

tag @s add chorus
execute if score game state = freeze state as @s run function ctf_maps:api/call/freeze
tellraw @s {"text": "You cannot use this now!", "color": "red"}

schedule function ctf_inv:internal/chorus/give_back 1t
