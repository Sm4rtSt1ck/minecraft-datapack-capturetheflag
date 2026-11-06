# A step of the breach ray in a block: counted (#wall bots); the first one: its distance (#wd bots,
# half blocks) and a marker 1 block above it (where the grenade is aimed); unbreakable: no breach
scoreboard players add #wall bots 1
execute if block ~ ~ ~ #ctf_bots:unbreakable run scoreboard players set #bad bots 1
execute if score #wall bots matches 1 run scoreboard players operation #wd bots = #step bots
execute if score #wall bots matches 1 run summon marker ~ ~0.5 ~ {Tags: ["bot_wall"]}
