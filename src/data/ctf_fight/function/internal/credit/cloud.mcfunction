# Runs every tick as a trap effect cloud (levitation, wither): everyone inside is marked
function ctf_fight:api/credit/owner
execute as @a[tag=player, distance=..2.5] run function ctf_fight:api/credit/mark {time: 200, src: 2}
# The bots too (BOTS.md)
execute as @e[type=zombified_piglin, tag=ctf_bot, distance=..2.5] run function ctf_fight:api/credit/mark {time: 200, src: 2}
