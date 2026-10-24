# Death without a killer: the same timing as the death camera, without the camera (only the
# darkness). The blindness of the death (ctf_fight:internal/die) is given again here: given at the
# death it is lost when the player respawns a tick later
scoreboard players set @s dc.t 0
tag @s add ctf.dc_on
tag @s add ctf.dc_blind
effect give @s minecraft:blindness 3 1 true
