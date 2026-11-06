# As a bot about to fight the player tagged bot_want (BOTS.md stage 10c): the times to kill both ways
# (hp x 100 / damage a second x 10: tenths of a second). He is low or dies fast: push (it fights
# whatever its role). It dies faster and is low itself: retreat (ctf_bots:internal/duel/retreat).
# The mace, he is below: it jumps down at him (ctf_bots:internal/duel/dive). A ranged weapon he is in
# range of: it shoots from where it stands (ctf_bots:internal/duel/stance).
# Else it runs at him (a ranged enemy far: stepping aside at random; the shortest way when he can't
# be reached straight: ctf_bots:internal/duel/chase) and fights
from registry:bots import DUEL, SENSE
execute at @p[tag=bot_want] run function ctf_bots:internal/team/dist
execute as @p[tag=bot_want] run function ctf_bots:internal/sense/wpn
function ctf_bots:internal/duel/class
function ctf_bots:internal/duel/my_dps
execute store result score #hp bots run data get entity @s Health
scoreboard players operation #ehp bots = @p[tag=bot_want] health
scoreboard players set #k bots 100
scoreboard players operation #ttk_me bots = #hp bots
scoreboard players operation #ttk_me bots *= #k bots
scoreboard players operation #ttk_me bots /= #edps bots
scoreboard players operation #ttk_him bots = #ehp bots
scoreboard players operation #ttk_him bots *= #k bots
scoreboard players operation #ttk_him bots /= #mdps bots
scoreboard players set #push bots 0
execute if score #ehp bots matches (f"..{SENSE['low']}") run scoreboard players set #push bots 1
execute if score #ttk_him bots matches (f"..{DUEL['push']}") run scoreboard players set #push bots 1
execute if score #push bots matches 1 run function ctf_bots:internal/talk/push
function ctf_bots:internal/trick/retreat_hp
execute if entity @s[tag=defense] if score @s bot.role matches 11 if score @s bot.trait matches 3 run function ctf_bots:internal/trick/ambush_call
execute if score #push bots matches 0 if score #hp bots <= #rhp bots if function ctf_bots:internal/duel/losing run return run function ctf_bots:internal/duel/retreat
execute if score @s bot.mw matches 9 if function ctf_bots:internal/duel/dive run return 1
execute if function ctf_bots:internal/duel/stance run return 1
execute if score #eranged bots matches 1 if score #dist bots matches (f"{DUEL['dodge']}..") if predicate {condition: "minecraft:random_chance", chance: 0.5} if predicate {condition: "minecraft:entity_properties", entity: "this", predicate: {flags: {is_on_ground: true}}} run function ctf_bots:internal/duel/dodge
function ctf_bots:internal/duel/chase
return 1
