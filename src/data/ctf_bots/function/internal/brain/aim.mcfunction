# As a bot: its target is the entity tagged bot_aim (its lure or a player). A zombified piglin is a
# neutral mob: AngryAt (the target's UUID) loaded into it sets its target right away, no hit needed
# (vanilla reads it when the NBT is loaded: NeutralMob persistent anger); AngerTime keeps it angry
data modify entity @s AngryAt set from entity @n[tag=bot_aim, type=rabbit] UUID
data modify entity @s AngerTime set value 1000000
