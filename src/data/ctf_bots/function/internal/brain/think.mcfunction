# As a bot, at it (4 times a second): what to do now. The target is set only when it changes
# (ctf_bots:internal/brain/target_want, lure_here). A climbing bot only climbs (ctf_bots:internal/climb)
execute if entity @s[tag=bot_climb] run return 0
scoreboard players operation #me bots = @s bot.n
tag @s add bk_me
# Asleep in the air (it got on guard while jumping / falling, or the ground under it is gone): awake
execute if entity @s[tag=bot_guard] unless predicate {condition: "minecraft:entity_properties", entity: "this", predicate: {flags: {is_on_ground: true}}} run function ctf_bots:internal/brain/unguard
execute if entity @s[tag=bot_guard] if block ~ ~-0.2 ~ #ctf_bots:gap run function ctf_bots:internal/brain/unguard
# What it sees and hears (ctf_bots:internal/sense/look: tag bk_seen, the team memory)
function ctf_bots:internal/sense/look
execute if score @s bot.alt matches 1.. run scoreboard players remove @s bot.alt 1
execute unless entity @s[tag=bot_fall] unless predicate {condition: "minecraft:entity_properties", entity: "this", predicate: {flags: {is_on_ground: true}}} if function ctf_bots:internal/nav/falling run tag @s add bot_fall
execute if score @s bot.nopick matches 1.. run scoreboard players remove @s bot.nopick 1
execute if score @s bot.pn matches 1.. run scoreboard players remove @s bot.pn 1
# Its wallet follows it (its death place: ctf_bots:internal/learn/wallet_check)
execute if score #map lrn matches 1.. as @e[type=marker, tag=bot_wallet] if score @s bot.n = #me bots run function ctf_bots:internal/learn/wallet_here
execute if score @s bot.nopick matches ..0 run tag @s remove bot_thrower
execute if score @s bot.ret matches 1.. run scoreboard players remove @s bot.ret 1
execute if score @s bot.retcd matches 1.. run scoreboard players remove @s bot.retcd 1
execute if score @s bot.say matches 1.. run scoreboard players remove @s bot.say 1
tag @s remove bot_stance
execute as @e[type=rabbit, tag=bot_lure] if score @s bot.own = #me bots run tag @s add bot_mylure
execute if score @s bot.clw matches 1.. run scoreboard players remove @s bot.clw 1
# A ladder to climb (ctf_bots:internal/climb/go), a detour (ctf_bots:internal/brain/detour), else its
# side's thinking (ctf_bots:internal/brain/act)
execute if score @s bot.clm matches 1.. run function ctf_bots:internal/climb/go
execute if score @s bot.det matches 1.. unless score @s bot.clm matches 1.. if entity @s[tag=!bot_climb] run function ctf_bots:internal/brain/detour
execute if entity @s[tag=!bot_climb] run function ctf_bots:internal/brain/act
tag @e[type=rabbit, tag=bot_mylure] remove bot_mylure
tag @a remove bot_want
tag @a remove bot_tgt
tag @e[type=marker, tag=bot_post] remove bot_post
tag @a remove bk_seen
tag @s remove bk_me
