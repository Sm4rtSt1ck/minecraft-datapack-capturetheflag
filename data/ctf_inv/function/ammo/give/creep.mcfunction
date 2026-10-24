# The only way Creepenator arrows are given (all of them stack: bound to the player). count
$data modify storage ctf_loot:tmp creep set value {count: $(count)}
execute store result storage ctf_loot:tmp creep.owner int 1 run scoreboard players get @s player_id
function ctf_loot:reward/creep/arrows with storage ctf_loot:tmp creep
