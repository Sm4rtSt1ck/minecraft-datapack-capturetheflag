# As a bot given a role against the enemy #who bots (distract, rotate)
$scoreboard players set @s bot.role $(role)
scoreboard players operation @s bot.foe = #who bots
tag @s add bk_asg
