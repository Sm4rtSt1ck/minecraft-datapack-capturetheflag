# Runs as a player killed (vanilla kill credit) while marked by a trap of kc.by (ctf:match/events/fight/die).
# The money and the kill were given by the vanilla kill; only the loot crate task "enemy_trap" is added
# for an attacker who set the trap off and killed a defender (attackers have no traps of their own)
execute unless entity @s[tag=defense] run return 0
scoreboard players operation #by kc.tmp = @s kc.by
execute as @a[tag=player, tag=attack] if score @s player_id = #by kc.tmp run function ctf_loot:task {id: "enemy_trap"}
