# Stuns the enemies within 2.5 blocks for 3 seconds: almost no movement, no jumping, no hitting. team
$execute as @a[tag=$(team), tag=player, gamemode=!spectator, distance=..2.5] run function ctf_loot:reward/stun/apply
particle minecraft:electric_spark ~ ~1 ~ 0.8 0.8 0.8 0.3 60 force @a[tag=!lobby]
particle minecraft:flash ~ ~1 ~ 0 0 0 0 1 force @a[tag=!lobby]
playsound minecraft:block.anvil.land block @a[tag=!lobby] ~ ~ ~ 1 1.6
playsound minecraft:entity.lightning_bolt.thunder block @a[tag=!lobby] ~ ~ ~ 0.4 2
kill @s
