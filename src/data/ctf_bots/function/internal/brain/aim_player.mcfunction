# As a bot: its target is the player tagged bot_want (see ctf_bots:internal/brain/aim)
data modify entity @s AngryAt set from entity @p[tag=bot_want] UUID
data modify entity @s AngerTime set value 1000000
