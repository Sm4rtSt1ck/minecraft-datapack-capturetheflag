# As a known enemy trap marker within reach of an attack bot (ctf_bots:internal/traps/tick): it hits it like
# a player's hit with the hand (removed without going off: ctf_traps:api/disarm)
particle minecraft:crit ~ ~ ~ 0.3 0.3 0.3 0.2 15 normal @a[tag=!lobby]
playsound minecraft:entity.player.attack.crit player @a[tag=!lobby] ~ ~ ~ 1 1
function ctf_traps:api/disarm
