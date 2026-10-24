# Runs as a player killed (vanilla kill credit) while marked by a trap of kc.by (ctf_fight:internal/die).
# The money and the kill were given by the vanilla kill; only the loot crate task "enemy_trap" is added
# for an attacker who killed a defender with a trap (attackers have no traps of their own):
#   the attacker who set the trap off (kc.by), or else the attacker who got the kill: the last player who
#   hurt the victim (kc.hit), e.g. he knocked the defender into the trap
execute unless entity @s[tag=defense] run return 0
scoreboard players operation #by kc.tmp = @s kc.by
scoreboard players set #ok kc.tmp 0
execute as @a[tag=player, tag=attack] if score @s player_id = #by kc.tmp run scoreboard players set #ok kc.tmp 1
execute if score #ok kc.tmp matches 0 if score @s kc.hit matches -2147483648.. run scoreboard players operation #by kc.tmp = @s kc.hit
execute as @a[tag=player, tag=attack] if score @s player_id = #by kc.tmp run function ctf_loot:task {id: "enemy_trap"}
