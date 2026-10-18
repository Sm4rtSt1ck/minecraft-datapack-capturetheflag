execute store result score #s sn.tmp run data get storage ctf_sniper:config spread
scoreboard players operation #ns sn.tmp = #s sn.tmp
scoreboard players set #k sn.tmp -1
scoreboard players operation #ns sn.tmp *= #k sn.tmp
execute store result storage ctf_sniper:range min int 1 run scoreboard players get #ns sn.tmp
execute store result storage ctf_sniper:range max int 1 run scoreboard players get #s sn.tmp
function ctf_sniper:internal/spread_roll with storage ctf_sniper:range
