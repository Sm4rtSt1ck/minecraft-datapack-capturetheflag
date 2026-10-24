# Runs every tick as a player in a creeper
scoreboard players operation #me loot.tmp = @s player_id
execute as @e[type=creeper, tag=loot.creeper] if score @s loot.cown = #me loot.tmp run tag @s add loot.creeper_mine

# No creeper any more: it blew up -> the player dies, the kill goes to the player who made the creeper
execute unless entity @e[type=creeper, tag=loot.creeper_mine, limit=1] run return run function ctf_loot:reward/creep/blown

# The creeper is dying (killed) -> the player dies with it (no explosion), killed by its killer
execute store result score #hp loot.tmp run data get entity @e[type=creeper, tag=loot.creeper_mine, limit=1] Health 10
execute if score #hp loot.tmp matches ..0 run return run function ctf_loot:reward/creep/killed

# His name follows the creeper
execute as @e[type=bat, tag=loot.creep_tag] if score @s loot.cown = #me loot.tmp at @e[type=creeper, tag=loot.creeper_mine, limit=1] run tp @s ~ ~1.75 ~

# Forced: if the player left the creeper (sneak), he is put back
spectate @e[type=creeper, tag=loot.creeper_mine, limit=1] @s

# Kill credit of the explosion: while someone is close enough to light the fuse, everyone in the
# blast radius is marked for the player who made the creeper
scoreboard players reset #owner kc.tmp
execute if score @s loot.cby matches -2147483648.. run scoreboard players operation #owner kc.tmp = @s loot.cby
execute as @e[type=creeper, tag=loot.creeper_mine, limit=1] at @s if entity @a[tag=player, gamemode=!spectator, distance=..3.5] as @a[tag=player, distance=..7] run function ctf_fight:api/credit/mark {time: 10, src: 5}
execute as @e[type=creeper, tag=loot.creeper_mine, limit=1] at @s if entity @a[tag=player, gamemode=!spectator, distance=..3.5] run function ctf_fight:api/credit/mark_traps {r: 7}
tag @e[type=creeper, tag=loot.creeper_mine] remove loot.creeper_mine
