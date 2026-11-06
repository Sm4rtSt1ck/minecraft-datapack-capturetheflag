# As a bot shooting from where it stands: the player bot.shot (alive) gets the tag bot_tc
scoreboard players operation #shot bots = @s bot.shot
execute as @a[tag=player, tag=!dead, gamemode=!spectator] if score @s player_id = #shot bots run tag @s add bot_tc
