# Runs as a player hit by a grenade / trap / ultimate of #owner kc.tmp.
# If he dies within <time> ticks and no player gets the vanilla kill credit,
# the owner gets the kill (ctf_fight:internal/credit/victim). time, src
execute unless score #owner kc.tmp matches -2147483648..2147483647 run return 0
execute unless entity @s[tag=player, gamemode=!spectator] run return 0
scoreboard players operation @s kc.by = #owner kc.tmp
$scoreboard players set @s kc.time $(time)
$scoreboard players set @s kc.src $(src)
