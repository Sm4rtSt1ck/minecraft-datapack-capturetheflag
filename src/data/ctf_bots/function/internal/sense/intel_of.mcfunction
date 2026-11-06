# As an enemy player: his intel marker (the team memory about him) gets the tag bk_about; new if he
# has none (unknown: bk.age = SENSE "forget", nothing said)
from registry:bots import SENSE, TALK
scoreboard players operation #who bots = @s player_id
execute as @e[type=marker, tag=bot_intel] if score @s bk.id = #who bots run tag @s add bk_about
execute if entity @e[type=marker, tag=bk_about] run return 1
summon marker ~ ~ ~ {Tags: ["bot_intel", "map_entity", "bk_about"]}
scoreboard players operation @e[type=marker, tag=bk_about] bk.id = #who bots
scoreboard players set @e[type=marker, tag=bk_about] bk.age (SENSE["forget"])
scoreboard players set @e[type=marker, tag=bk_about] bk.said (TALK["again"])
scoreboard players set @e[type=marker, tag=bk_about] bk.src 0
scoreboard players set @e[type=marker, tag=bk_about] bk.hp 20
scoreboard players set @e[type=marker, tag=bk_about] bk.wpn 0
scoreboard players set @e[type=marker, tag=bk_about] bk.rl 1000
scoreboard players set @e[type=marker, tag=bk_about] bk.hc 20
