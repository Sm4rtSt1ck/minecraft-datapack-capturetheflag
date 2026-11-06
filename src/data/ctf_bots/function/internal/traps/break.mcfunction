# As an enemy trap marker an attack bot broke: removed without going off (like a player's hit with the
# hand: ctf_traps:internal/hit_by_hand; its display goes with it: ctf_traps:tick/combat)
particle minecraft:crit ~ ~ ~ 0.3 0.3 0.3 0.2 15 normal @a[tag=!lobby]
playsound minecraft:entity.player.attack.crit player @a[tag=!lobby] ~ ~ ~ 1 1
kill @s
