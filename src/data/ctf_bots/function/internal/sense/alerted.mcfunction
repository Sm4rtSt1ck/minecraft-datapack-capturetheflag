# As a warned bot (bot.alert = the player_id of the enemy behind it, ctf_bots:internal/sense/warn):
# he gets the tag bot_want (it turns to him and fights) while he is alive and near
scoreboard players operation #who bots = @s bot.alert
execute as @a[tag=player, tag=!dead, gamemode=!spectator, distance=..24] if score @s player_id = #who bots run tag @s add bot_want
