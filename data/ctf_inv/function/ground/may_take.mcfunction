# Runs as an item: loot crate rewards (ctf_bound) belong to one player only
execute unless entity @s[tag=ctf.owned] run return 1
execute if score @s player_id = #me inv.tmp run return 1
return 0
