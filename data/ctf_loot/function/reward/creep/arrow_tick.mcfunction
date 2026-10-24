# Runs every tick as a flying Creepenator arrow: green trail; players it can reach this tick (a bow
# arrow flies up to ~3 blocks per tick) get resistance 255 for one tick: the hit counts, but deals no
# damage. Players who already have resistance (freeze, the ghost ultimate) are protected anyway and
# are left alone, so their own resistance is never removed
particle minecraft:dust{color:[0.24, 0.7, 0.44], scale: 0.8} ~ ~ ~ 0 0 0 0 1 force @a[tag=!lobby]
tag @a[tag=player, gamemode=!spectator, distance=..6, nbt=!{active_effects: [{id: "minecraft:resistance"}]}] add loot.creep_res
