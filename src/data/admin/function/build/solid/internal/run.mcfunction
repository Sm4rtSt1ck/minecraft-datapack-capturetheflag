# Storage admin:build a {p, b, s}, #mode solid.tmp (1 place, 0 remove): checks the area and walks
# over its blocks. Returns 1 when done, fails on a wrong area

# p of 3 numbers: one block
execute store success score #one solid.tmp unless data storage admin:build a.p[3]
execute if score #one solid.tmp matches 1 run data modify storage admin:build a.p append from storage admin:build a.p[0]
execute if score #one solid.tmp matches 1 run data modify storage admin:build a.p append from storage admin:build a.p[1]
execute if score #one solid.tmp matches 1 run data modify storage admin:build a.p append from storage admin:build a.p[2]
execute unless data storage admin:build a.p[5] run tellraw @s {"text": "p: 3 or 6 coordinates: [x, y, z] or [x1, y1, z1, x2, y2, z2]", "color": "red"}
execute unless data storage admin:build a.p[5] run return fail

execute store result score #x1 solid.tmp run data get storage admin:build a.p[0]
execute store result score #y1 solid.tmp run data get storage admin:build a.p[1]
execute store result score #z1 solid.tmp run data get storage admin:build a.p[2]
execute store result score #x2 solid.tmp run data get storage admin:build a.p[3]
execute store result score #y2 solid.tmp run data get storage admin:build a.p[4]
execute store result score #z2 solid.tmp run data get storage admin:build a.p[5]

# Size of every side: |2 - 1| + 1
scoreboard players set #-1 solid.tmp -1
scoreboard players operation #sx solid.tmp = #x2 solid.tmp
scoreboard players operation #sx solid.tmp -= #x1 solid.tmp
execute if score #sx solid.tmp matches ..-1 run scoreboard players operation #sx solid.tmp *= #-1 solid.tmp
scoreboard players add #sx solid.tmp 1
scoreboard players operation #sy solid.tmp = #y2 solid.tmp
scoreboard players operation #sy solid.tmp -= #y1 solid.tmp
execute if score #sy solid.tmp matches ..-1 run scoreboard players operation #sy solid.tmp *= #-1 solid.tmp
scoreboard players add #sy solid.tmp 1
scoreboard players operation #sz solid.tmp = #z2 solid.tmp
scoreboard players operation #sz solid.tmp -= #z1 solid.tmp
execute if score #sz solid.tmp matches ..-1 run scoreboard players operation #sz solid.tmp *= #-1 solid.tmp
scoreboard players add #sz solid.tmp 1

# One call runs at most maxCommandChainLength (65536) commands: about 9 per block
scoreboard players operation #n solid.tmp = #sx solid.tmp
scoreboard players operation #n solid.tmp *= #sy solid.tmp
scoreboard players operation #n solid.tmp *= #sz solid.tmp
execute if score #n solid.tmp matches 5001.. run tellraw @s [{"text": "Too many blocks: ", "color": "red"}, {"score": {"name": "#n", "objective": "solid.tmp"}}, {"text": " (max 5000). Split the area."}]
execute if score #n solid.tmp matches 5001.. run return fail

# The lowest corner
scoreboard players operation #x1 solid.tmp < #x2 solid.tmp
scoreboard players operation #y1 solid.tmp < #y2 solid.tmp
scoreboard players operation #z1 solid.tmp < #z2 solid.tmp
execute store result storage admin:build at.x int 1 run scoreboard players get #x1 solid.tmp
execute store result storage admin:build at.y int 1 run scoreboard players get #y1 solid.tmp
execute store result storage admin:build at.z int 1 run scoreboard players get #z1 solid.tmp

function admin:build/solid/internal/state

scoreboard players operation #i solid.tmp = #sx solid.tmp
function admin:build/solid/internal/start with storage admin:build at

execute if score #mode solid.tmp matches 1 run tellraw @s [{"text": "Unbreakable blocks placed: ", "color": "green"}, {"score": {"name": "#n", "objective": "solid.tmp"}}]
execute if score #mode solid.tmp matches 0 run tellraw @s [{"text": "Unbreakable blocks removed in ", "color": "yellow"}, {"score": {"name": "#n", "objective": "solid.tmp"}}, {"text": " blocks"}]
return 1
