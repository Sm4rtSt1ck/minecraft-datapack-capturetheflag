# The links of storage work2 one by one: seen from players (n), passed (s) / failed (f) by bots
execute unless data storage ctf_bots:learn work2[0] run return 0
scoreboard players add #S_lk lrn 1
execute store result score #v lrn run data get storage ctf_bots:learn work2[0].n
execute if score #v lrn matches 1.. run scoreboard players add #S_obs lrn 1
scoreboard players operation #S_n lrn += #v lrn
execute store result score #v lrn run data get storage ctf_bots:learn work2[0].s
scoreboard players operation #S_s lrn += #v lrn
execute store result score #v lrn run data get storage ctf_bots:learn work2[0].f
scoreboard players operation #S_f lrn += #v lrn
data remove storage ctf_bots:learn work2[0]
function ctf_bots:internal/learn/stat_links
