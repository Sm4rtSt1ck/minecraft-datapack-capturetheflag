# As a player (every LEARN "heat" ticks), at him: the point within 8 counts him: an attacker / defender
# while the flag stands (lrn.ha / lrn.hd), carrying the flag (lrn.hc)
execute if entity @e[type=armor_stand, tag=flag] if entity @s[tag=attack] as @n[type=marker, tag=lrn_pt, distance=..8] run scoreboard players add @s lrn.ha 10
execute if entity @e[type=armor_stand, tag=flag] if entity @s[tag=defense] as @n[type=marker, tag=lrn_pt, distance=..8] run scoreboard players add @s lrn.hd 10
execute if items entity @s container.* magenta_banner as @n[type=marker, tag=lrn_pt, distance=..8] run scoreboard players add @s lrn.hc 10
execute if items entity @s weapon.offhand magenta_banner as @n[type=marker, tag=lrn_pt, distance=..8] run scoreboard players add @s lrn.hc 10
