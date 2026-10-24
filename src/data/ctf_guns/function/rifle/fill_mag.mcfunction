# Full magazine (purchase, start of freeze), if the player has the rifle
function ctf_inv:limits/count {pred: '*[custom_data~{wpn:"rifle"}]'}
execute if score #n inv.tmp matches ..0 run return 0
execute unless data storage ctf_guns:config rifle_mag run function ctf_guns:config
execute store result score @s rf.mag run data get storage ctf_guns:config rifle_mag
scoreboard players reset @s rf.reload
