# As a player at freeze: his context, one more round of it
function ctf_bots:internal/learn/my_ctx
data modify storage ctf_bots:learn arg set value {ctx: 0, id: "n"}
execute store result storage ctf_bots:learn arg.ctx int 1 run scoreboard players get @s lrn.ctx
function ctf_bots:internal/learn/buy_add with storage ctf_bots:learn arg
