# #ctf:on/player_reset
execute if entity @s[tag=ctf.dc_on] run function ctf:match/events/fight/deathcam/stop
