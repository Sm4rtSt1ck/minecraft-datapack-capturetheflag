execute store result score @s posX run data get entity @s Pos[0] 1
execute store result score @s posY run data get entity @s Pos[1] 1
execute store result score @s posZ run data get entity @s Pos[2] 1

scoreboard players operation @s posX += offset posX
scoreboard players operation @s posY += offset posY
scoreboard players operation @s posZ += offset posZ

execute store result storage ctf:clone PosX double 1 run scoreboard players get @s posX
execute store result storage ctf:clone PosY double 1 run scoreboard players get @s posY
execute store result storage ctf:clone PosZ double 1 run scoreboard players get @s posZ

function ctf:match/prepare/entity_clone/summon_macros {type: "minecart"}
function ctf:match/prepare/entity_clone/summon_macros {type: "chest_minecart"}
function ctf:match/prepare/entity_clone/summon_macros {type: "hopper_minecart"}
function ctf:match/prepare/entity_clone/summon_macros {type: "furnace_minecart"}
function ctf:match/prepare/entity_clone/summon_macros {type: "tnt_minecart"}
function ctf:match/prepare/entity_clone/summon_macros {type: "oak_boat"}
function ctf:match/prepare/entity_clone/summon_macros {type: "oak_chest_boat"}
function ctf:match/prepare/entity_clone/summon_macros {type: "bamboo_chest_raft"}
function ctf:match/prepare/entity_clone/summon_macros {type: "item"}
function ctf:match/prepare/entity_clone/summon_macros {type: "armor_stand"}
function ctf:match/prepare/entity_clone/summon_macros {type: "painting"}
function ctf:match/prepare/entity_clone/summon_macros {type: "item_frame"}
function ctf:match/prepare/entity_clone/summon_macros {type: "glow_item_frame"}
function ctf:match/prepare/entity_clone/summon_macros {type: "cow"}
function ctf:match/prepare/entity_clone/summon_macros {type: "pig"}
function ctf:match/prepare/entity_clone/summon_macros {type: "sheep"}
function ctf:match/prepare/entity_clone/summon_macros {type: "chicken"}

data modify entity @n[tag=clone, tag=target] {} merge from entity @s {}
tag @s add map_entity

data modify entity @s Pos[0] set from storage ctf:clone PosX
data modify entity @s Pos[1] set from storage ctf:clone PosY
data modify entity @s Pos[2] set from storage ctf:clone PosZ

execute positioned as @s run tp @s ~0.5 ~ ~0.5
