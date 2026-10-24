# Runs once as a shot Creepenator arrow (ctf_inv:ground/arrow). It hits hard, so the damage cooldown of
# a player who was just hurt never cancels the hit; nobody gets this damage: players next to the arrow
# are protected for that tick (ctf_loot:reward/creep/arrow_tick), so a hit works even at low health
data modify entity @s damage set value 10d
tag @s add loot.creep_arrow
