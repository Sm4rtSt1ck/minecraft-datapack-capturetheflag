# As a player who went from the point lrn.from to the point #pid lrn: the observed link, its kind from what
# he did on the way (1 walk, 3 a jump, 7 a fall of 4+ blocks, 8 a wind charge, 5 / 6 a ladder up / down);
# stored (ctf_bots:internal/learn/link_obs)
scoreboard players set #t lrn 1
scoreboard players operation #d lrn = @s lrn.sj
scoreboard players operation #d lrn -= @s lrn.bj
execute if score #d lrn matches 1.. run scoreboard players set #t lrn 3
scoreboard players operation #df lrn = @s lrn.sf
scoreboard players operation #df lrn -= @s lrn.bf
execute if score #df lrn matches 400.. run scoreboard players set #t lrn 7
scoreboard players operation #d lrn = @s lrn.sw
scoreboard players operation #d lrn -= @s lrn.bw
execute if score #d lrn matches 1.. run scoreboard players set #t lrn 8
scoreboard players operation #d lrn = @s lrn.sc
scoreboard players operation #d lrn -= @s lrn.bc
execute if score #d lrn matches 100.. if score #df lrn matches ..199 run scoreboard players set #t lrn 5
execute if score #d lrn matches 100.. if score #df lrn matches 200.. run scoreboard players set #t lrn 6
data modify storage ctf_bots:learn arg set value {a: 0, b: 0, t: 1}
execute store result storage ctf_bots:learn arg.a int 1 run scoreboard players get @s lrn.from
execute store result storage ctf_bots:learn arg.b int 1 run scoreboard players get #pid lrn
execute store result storage ctf_bots:learn arg.t int 1 run scoreboard players get #t lrn
function ctf_bots:internal/learn/link_obs with storage ctf_bots:learn arg
