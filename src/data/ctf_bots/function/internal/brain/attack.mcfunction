# An attack bot thinks
# Carrying the flag: to the win trigger, nothing else
execute if entity @s[tag=bot_carrier] if entity @e[type=armor_stand, tag=win_trigger, distance=..2.5] run return run function ctf_bots:internal/flag/deliver
execute if entity @s[tag=bot_carrier] at @n[type=armor_stand, tag=win_trigger] run return run function ctf_bots:internal/brain/lure_here
# The flag on the ground next to it, nobody carries it: picked up
execute if entity @e[type=item, tag=bot_flag_item, distance=..1.5] unless entity @e[type=zombified_piglin, tag=bot_carrier] run return run function ctf_bots:internal/flag/pickup
# Fighting a defender: go on; hit by a defender: fight back; a defender in sight near: fight
execute on target if entity @s[type=player, tag=defense, tag=!dead] run return 1
execute on attacker if entity @s[type=player, tag=defense, tag=!dead, gamemode=!spectator] run tag @s add bot_want
scoreboard players set #enemy bots 2
execute unless entity @a[tag=bot_want] run function ctf_bots:internal/brain/spot
execute if entity @a[tag=bot_want] run return run function ctf_bots:internal/brain/target_want
# The placed flag next to it: broken in 3 seconds (12 thinks; then its banner is removed and
# ctf_flag:tick/combat breaks the flag)
execute if entity @e[type=armor_stand, tag=flag, distance=..2.5] run return run function ctf_bots:internal/flag/breaking
scoreboard players set @s bot.brk 0
# Its route, then the flag
execute if score @s bot.r matches 1.. if score @s bot.w matches 1.. run return run function ctf_bots:internal/brain/route
function ctf_bots:internal/brain/objective
