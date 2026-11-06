# As a bot stuck for a while (ctf_bots:internal/brain/stuck): its target (lure, player) 2+ blocks above
# it: a ladder near (ctf_bots:internal/climb/search); then no new search for 2 s
execute store result score #y bots run data get entity @s Pos[1]
execute on target store result score #ty bots run data get entity @s Pos[1]
scoreboard players operation #ty bots -= #y bots
execute unless score #ty bots matches 2.. run return 0
scoreboard players set @s bot.clw 8
execute align xyz positioned ~0.5 ~ ~0.5 if function ctf_bots:internal/climb/search run scoreboard players set @s bot.stk 0
