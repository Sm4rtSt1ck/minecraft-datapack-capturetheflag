# Advancement reward: runs as the player at the moment of his death. "on attacker" gives the entity
# that killed him, so every victim gets his own killer even if several players die in the same tick.
# (Grenade / trap / ultimate kills: the killer is set by ctf:match/events/credit/award)
advancement revoke @s only ctf:death_killer
scoreboard players reset @s dc.killer
tag @s add ctf.victim
execute on attacker if entity @s[type=player] run scoreboard players operation @a[tag=ctf.victim, limit=1] dc.killer = @s player_id
tag @s remove ctf.victim
