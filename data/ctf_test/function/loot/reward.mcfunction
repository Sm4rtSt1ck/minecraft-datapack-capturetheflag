# Gives a reward of the loot crates (bound to you). id: inferno / walls / stun
execute store result storage ctf_test:tmp rw.owner int 1 run scoreboard players get @s player_id
data modify storage ctf_test:tmp rw.cmd set value "give @s"
$function ctf_loot:reward/$(id) with storage ctf_test:tmp rw
