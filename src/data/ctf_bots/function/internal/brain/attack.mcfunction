# An attack bot thinks
# Carrying the flag: to the win trigger, nothing else
execute if entity @s[tag=bot_carrier] if entity @e[type=armor_stand, tag=win_trigger, distance=..2.5] run return run function ctf_bots:internal/flag/deliver
execute if entity @s[tag=bot_carrier] at @n[type=armor_stand, tag=win_trigger] run return run function ctf_bots:internal/brain/lure_here
# An enemy trap in sight next to it: broken
function ctf_bots:internal/traps/break_check
# The flag on the ground next to it, nobody carries it: picked up (not by the bot that just threw it)
execute if entity @e[type=item, tag=bot_flag_item, distance=..1.5] unless entity @e[type=zombified_piglin, tag=bot_carrier] unless entity @s[tag=bot_thrower] run return run function ctf_bots:internal/flag/pickup
# Falling back after a lost duel (ctf_bots:internal/duel/retreat_go)
execute if score @s bot.ret matches 1.. if function ctf_bots:internal/duel/retreat_go run return 1
# A known enemy sniper sees it from afar: to cover (ctf_bots:internal/duel/sniper)
execute if entity @e[type=marker, tag=bot_intel] if function ctf_bots:internal/duel/sniper run return 1
# Fighting a defender: go on while its role wants it (ctf_bots:internal/team/keep); hit by a defender:
# fight back; warned: turn; a defender in sight: fight if its role wants it (team/consider); the fight
# itself: ctf_bots:internal/duel/engage (push, retreat, shooting from where it stands)
execute on target if entity @s[type=player, tag=defense, tag=!dead] run tag @s add bot_cand
execute if entity @a[tag=bot_cand] if function ctf_bots:internal/team/keep run tag @a[tag=bot_cand] add bot_want
tag @a remove bot_cand
execute on attacker if entity @s[type=player, tag=defense, tag=!dead, gamemode=!spectator] run tag @s add bot_want
execute if score @s bot.alt matches 1.. unless entity @a[tag=bot_want] run function ctf_bots:internal/sense/alerted
execute unless entity @a[tag=bot_want] run function ctf_bots:internal/brain/spot
execute if entity @a[tag=bot_cand] if function ctf_bots:internal/team/consider run tag @a[tag=bot_cand] add bot_want
execute if entity @a[tag=bot_cand] unless entity @a[tag=bot_want] run function ctf_bots:internal/duel/fire_move
tag @a remove bot_cand
execute if entity @a[tag=bot_want] run return run function ctf_bots:internal/duel/engage
# The placed flag next to it: broken in 3 seconds (12 thinks; then its banner is removed and
# ctf_flag:tick/combat breaks the flag)
execute if entity @e[type=armor_stand, tag=flag, distance=..2.5] run return run function ctf_bots:internal/flag/breaking
scoreboard players set @s bot.brk 0
# Its role's way (distract: to its enemy; cover: with the breaker; search: to the next spot to check;
# fetch: to the flag on the ground);
# the fake: noise on the other side (ctf_bots:internal/trick/fake_go); the breaker straight to the flag,
# waiting near it for the fake and its cover (ctf_bots:internal/trick/stage)
execute if function ctf_bots:internal/team/move run return 1
execute if score @s bot.role matches 5 run return run function ctf_bots:internal/team/search
execute if score @s bot.role matches 6 if entity @e[type=item, tag=bot_flag_item] at @n[type=item, tag=bot_flag_item] run return run function ctf_bots:internal/brain/lure_here
execute if score @s bot.role matches 7 run return run function ctf_bots:internal/trick/fake_go
execute if score @s bot.role matches 2 if function ctf_bots:internal/trick/stage run return 1
execute if score @s bot.role matches 2 run return run function ctf_bots:internal/brain/objective
# Its route, then the flag
execute if score @s bot.r matches 1.. if score @s bot.w matches 1.. run return run function ctf_bots:internal/brain/route
function ctf_bots:internal/brain/objective
