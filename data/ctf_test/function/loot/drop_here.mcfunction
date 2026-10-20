# A crate for you falls onto the block you stand in. rarity
execute at @s align xyz run summon marker ~ ~ ~ {Tags: ["ctf_test.pos"]}
execute store result storage ctf_test:tmp drop.x int 1 run data get entity @e[type=marker, tag=ctf_test.pos, limit=1] Pos[0]
execute store result storage ctf_test:tmp drop.y int 1 run data get entity @e[type=marker, tag=ctf_test.pos, limit=1] Pos[1]
execute store result storage ctf_test:tmp drop.z int 1 run data get entity @e[type=marker, tag=ctf_test.pos, limit=1] Pos[2]
kill @e[type=marker, tag=ctf_test.pos]
$data modify storage ctf_test:tmp drop.rarity set value "$(rarity)"
function ctf_loot:drop_for with storage ctf_test:tmp drop
