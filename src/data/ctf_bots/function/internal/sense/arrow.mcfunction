# As a new arrow: shot by a player -> a noise (ctf_bots:on/noise, kind bow) at him
tag @s add bk_arrow
data modify storage ctf:noise kind set value "bow"
execute on origin if entity @s[type=player] at @s run function ctf_bots:on/noise
