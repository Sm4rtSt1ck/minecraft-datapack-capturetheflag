# As a bot stuck chasing the player tagged bot_jt (he is above it, behind a fence...): to him along
# the navigation graph (ctf_bots:internal/brain/detour) for up to 10 s (40 thinks); no graph: nothing
scoreboard players set @s bot.stk 0
execute unless score #ready nav matches 1 run return 0
scoreboard players operation @s bot.dp = @p[tag=bot_jt] player_id
scoreboard players set @s bot.det 40
