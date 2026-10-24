# Runs as a player who threw a splash potion (just_threw_smoke)
scoreboard players set @s just_threw_smoke 0

# The thrown smoke grenade (the nearest new one)
execute at @s as @e[type=potion, tag=!ctf.smoke_checked, distance=..5] run function ctf:match/events/grenades/smoke/check_potion

# Freeze: no smoke, the grenade is given back
execute if score game state = freeze state if entity @e[type=potion, tag=ctf.smoke_potion, tag=ctf.smoke_new] run function ctf:match/events/grenades/smoke/refund
tag @e[type=potion, tag=ctf.smoke_new] remove ctf.smoke_new
