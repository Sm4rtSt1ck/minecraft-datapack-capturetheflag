# As a bot: #st bots = its strength (hp + 4 x armor tier)
execute store result score #st bots run data get entity @s Health
scoreboard players operation #k bots = @s bot.arm
scoreboard players operation #k bots += @s bot.arm
scoreboard players operation #k bots += #k bots
scoreboard players operation #st bots += #k bots
