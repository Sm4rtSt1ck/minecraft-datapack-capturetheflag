# As a bot: the player it fights gets the tag bot_tc: shooting from where it stands (bot_stance,
# ctf_bots:internal/duel/stance): the player bot.shot; else its target (a player)
execute if entity @s[tag=bot_stance] run function ctf_bots:internal/duel/shot_target
execute unless entity @s[tag=bot_stance] on target if entity @s[type=player, tag=player, tag=!dead] run tag @s add bot_tc
