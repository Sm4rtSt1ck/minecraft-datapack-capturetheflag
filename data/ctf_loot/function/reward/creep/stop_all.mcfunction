# Start of freeze, team swap, end of the match: players in creepers are back, the creepers are removed
# (the players get their gamemode and position from the freeze start)
execute as @a[tag=loot.creep] run function ctf_loot:reward/creep/end
execute as @e[type=creeper, tag=loot.creeper] run function ctf_loot:reward/creep/remove
execute as @e[type=bat, tag=loot.creep_tag] run function ctf_loot:reward/creep/remove
