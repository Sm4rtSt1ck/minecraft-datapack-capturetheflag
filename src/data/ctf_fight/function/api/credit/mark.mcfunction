# Runs as a player or a bot (BOTS.md) hit by a grenade / trap / ultimate of #owner kc.tmp (a trap: an
# attacker's killer is #placer kc.tmp).
# If he dies within <time> ticks and no player gets the vanilla kill credit,
# the owner gets the kill (ctf_fight:internal/credit/victim). time, src
execute unless score #owner kc.tmp matches -2147483648..2147483647 run return 0
execute unless entity @s[tag=player, gamemode=!spectator] unless entity @s[type=zombified_piglin, tag=ctf_bot] run return 0
scoreboard players operation @s kc.by = #owner kc.tmp
# An attacker hit by a trap: its kill is for who placed it (the owner is the attacker who set it off)
execute if entity @s[tag=attack] if score #placer kc.tmp matches -2147483648..2147483647 run scoreboard players operation @s kc.by = #placer kc.tmp
$scoreboard players set @s kc.time $(time)
$scoreboard players set @s kc.src $(src)
