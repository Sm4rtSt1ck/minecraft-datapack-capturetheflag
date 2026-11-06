# Round start, as a bot: its lure (ctf_bots:internal/brain/new_lure), its route (attack) or its
# defend spot (defense; a bot sent to its spot at freeze has it: ctf_bots:internal/brain/post)
scoreboard players operation #me bots = @s bot.n
function ctf_bots:internal/brain/new_lure
tag @e[type=rabbit, tag=bot_mylure] remove bot_mylure
tag @s remove bot_guard
scoreboard players set @s bot.t 0
scoreboard players set @s bot.brk 0
scoreboard players set @s bot.det 0
scoreboard players set @s bot.stk 0
scoreboard players set @s bot.clm 0
scoreboard players set @s bot.clw 0
tag @s remove bot_climb
tag @s remove bot_down
tag @s remove bot_godown
scoreboard players set @s bot.gn 0
scoreboard players set @s bot.role 0
execute if entity @s[tag=attack] unless score #fknown bots matches 1 run scoreboard players set @s bot.role 5
scoreboard players set @s bot.ret 0
scoreboard players set @s bot.wt 0
scoreboard players set @s bot.nz 0
tag @s remove bot_faked
tag @s remove bot_stance
scoreboard players set @s bot.prole 0
tag @s remove bot_brk
function ctf_bots:internal/nav/reset
function ctf_bots:internal/nav/off
tag @s remove bot_close
execute if entity @s[tag=attack] run function ctf_bots:internal/brain/pick_route
execute if entity @s[tag=defense, tag=!bot_posted] run function ctf_bots:internal/brain/pick_spot
tag @s remove bot_posted
