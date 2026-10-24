# Places the flag block at the target. target, rotation
$execute positioned as $(target) run setblock ~ ~ ~ magenta_banner[rotation=$(rotation)]
execute unless data storage ctf:flag patterns run function ctf_flag:config
$execute positioned as $(target) run data modify block ~ ~ ~ patterns set from storage ctf:flag patterns
