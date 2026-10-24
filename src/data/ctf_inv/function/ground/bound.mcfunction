tag @s add ctf.owned
execute store result score @s player_id run data get entity @s Item.components."minecraft:custom_data".ctf_owner
