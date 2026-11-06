# Runs as the wallet of a bot (ctf_bots) that died while marked by a grenade / trap / ultimate (its
# kc.by / kc.src copied there) and that no player killed (vanilla): like a player victim
# (ctf_fight:internal/credit/victim), the owner gets the kill
scoreboard players operation #by kc.tmp = @s kc.by
scoreboard players operation #src kc.tmp = @s kc.src
scoreboard players set #vside kc.tmp 0
execute if entity @s[tag=attack] run scoreboard players set #vside kc.tmp 1
execute if entity @s[tag=defense] run scoreboard players set #vside kc.tmp 2
execute as @a[tag=player] if score @s player_id = #by kc.tmp run function ctf_fight:internal/credit/award
