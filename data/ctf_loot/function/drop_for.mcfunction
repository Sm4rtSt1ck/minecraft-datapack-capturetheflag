# A crate for the executing player falls from 30 blocks above (through any blocks) onto x y z.
# rarity: common / rare / epic / legendary / mythic
execute unless data storage ctf_loot:config rarities run function ctf_loot:config
$execute unless data storage ctf_loot:config rarities.$(rarity) run return run tellraw @a[tag=admin] {"text": "[ctf_loot] Unknown rarity: $(rarity)", "color": "red"}
$data modify storage ctf_loot:tmp d set value {x: $(x), y: $(y), z: $(z), rarity: "$(rarity)"}
$data modify storage ctf_loot:tmp d.r set from storage ctf_loot:config rarities.$(rarity)
execute store result storage ctf_loot:tmp d.owner int 1 run scoreboard players get @s player_id
data modify storage ctf_loot:tmp d.uuid set from entity @s UUID
$scoreboard players set #y loot.tmp $(y)
scoreboard players add #y loot.tmp 1
execute store result storage ctf_loot:tmp d.sy int 1 run scoreboard players get #y loot.tmp
scoreboard players add #y loot.tmp 29
execute store result storage ctf_loot:tmp d.top int 1 run scoreboard players get #y loot.tmp
function ctf_loot:internal/summon with storage ctf_loot:tmp d
