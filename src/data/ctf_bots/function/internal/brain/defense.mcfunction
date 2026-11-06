# A defense bot thinks
# A player carries the flag: chase him (he glows: seen from anywhere), unless it intercepts him at the
# delivery point (role 14)
execute if entity @a[tag=bot_flag_player] unless score @s bot.role matches 14 run tag @p[tag=bot_flag_player] add bot_want
execute if entity @a[tag=bot_want] run return run function ctf_bots:internal/duel/engage
# Falling back after a lost duel (ctf_bots:internal/duel/retreat_go)
execute if score @s bot.ret matches 1.. if function ctf_bots:internal/duel/retreat_go run return 1
# A known enemy sniper sees it from afar: to cover (ctf_bots:internal/duel/sniper)
execute if entity @e[type=marker, tag=bot_intel] if function ctf_bots:internal/duel/sniper run return 1
# Fighting an attacker: go on, unless he leads it too far from its post (the anchor: from the flag;
# ctf_bots:internal/brain/leash) or its role doesn't want it (team/keep); hit by an attacker: fight
# back; warned: turn; an attacker in sight: fight if its role wants it (team/consider); the fight
# itself: ctf_bots:internal/duel/engage
execute unless score @s bot.role matches 12 as @e[type=marker, tag=bot_defend] if score @s bot.own = #me bots run tag @s add bot_post
execute on target if entity @s[type=player] run tag @s add bot_tgt
execute if entity @a[tag=bot_tgt] if function ctf_bots:internal/brain/leash run return 1
execute on target if entity @s[type=player, tag=attack, tag=!dead] run tag @s add bot_cand
execute if entity @a[tag=bot_cand] if function ctf_bots:internal/team/keep run tag @a[tag=bot_cand] add bot_want
tag @a remove bot_cand
execute on attacker if entity @s[type=player, tag=attack, tag=!dead, gamemode=!spectator] run tag @s add bot_want
execute if score @s bot.alt matches 1.. unless entity @a[tag=bot_want] run function ctf_bots:internal/sense/alerted
execute unless entity @a[tag=bot_want] run function ctf_bots:internal/brain/spot
execute if entity @a[tag=bot_cand] if function ctf_bots:internal/team/consider run tag @a[tag=bot_cand] add bot_want
execute if entity @a[tag=bot_cand] unless entity @a[tag=bot_want] run function ctf_bots:internal/duel/fire_move
tag @a remove bot_cand
execute if entity @a[tag=bot_want] run return run function ctf_bots:internal/duel/engage
# Intercepting: at the delivery point
execute if score @s bot.role matches 14 run return run function ctf_bots:internal/team/intercept
# The flag on the ground: guard it
execute if entity @e[type=item, tag=bot_flag_item] at @n[type=item, tag=bot_flag_item] run return run function ctf_bots:internal/brain/lure_here
# Rotating: to where its enemy was (ctf_bots:internal/team/move)
execute if function ctf_bots:internal/team/move run return 1
# Its defend spot (guarding there, asleep: no swinging at the lure), else the flag (the anchor: always
# the flag)
execute unless score @s bot.role matches 12 as @e[type=marker, tag=bot_defend] if score @s bot.own = #me bots run tag @s add bot_dest
execute if entity @e[type=marker, tag=bot_dest, distance=..1.5] run function ctf_bots:internal/brain/guard
execute if entity @e[type=marker, tag=bot_dest] unless entity @e[type=marker, tag=bot_dest, distance=..1.5] at @n[type=marker, tag=bot_dest] run function ctf_bots:internal/brain/lure_here
execute unless entity @e[type=marker, tag=bot_dest] if entity @e[type=armor_stand, tag=flag, distance=..3] run function ctf_bots:internal/brain/guard
execute unless entity @e[type=marker, tag=bot_dest] if entity @e[type=armor_stand, tag=flag] unless entity @e[type=armor_stand, tag=flag, distance=..3] at @n[type=armor_stand, tag=flag] run function ctf_bots:internal/brain/lure_here
tag @e[type=marker, tag=bot_dest] remove bot_dest
