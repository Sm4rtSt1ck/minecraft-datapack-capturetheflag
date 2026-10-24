# #ctf:tick/combat (round, end_round)
# Loot crate task "unkillable" (after the deaths: only alive players)
execute as @a[tag=attack, tag=player, tag=!dead, tag=!loot.unkill, gamemode=!spectator, scores={loot.dmg=1..}] run function ctf_loot:unkillable
