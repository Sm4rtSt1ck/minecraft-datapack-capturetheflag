# The box marker (keeps the crate data) and an interaction entity over the box: it catches the
# clicks, so the box is never opened as a container, only "claimed" by its owner. x, y, z
$summon marker $(x) $(y) $(z) {Tags: ["ctf.loot_box", "ctf.loot_new"]}
$summon interaction $(x) $(y) $(z) {Tags: ["ctf.loot_click", "ctf.loot_new"], width: 1.05f, height: 1.05f, response: 1b}
execute as @e[tag=ctf.loot_new] at @s run tp @s ~0.5 ~ ~0.5
data modify entity @e[type=marker, tag=ctf.loot_new, limit=1] data set from entity @s data
tag @e[tag=ctf.loot_new] remove ctf.loot_new
