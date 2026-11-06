# #ctf:on/bought (as a player who bought the product storage ctf:bought id): counted in his context
execute unless score Bots_learn settings matches 1 run return 0
execute unless entity @s[type=player] run return 0
data modify storage ctf_bots:learn arg set value {ctx: 0, id: ""}
execute store result storage ctf_bots:learn arg.ctx int 1 run scoreboard players get @s lrn.ctx
data modify storage ctf_bots:learn arg.id set from storage ctf:bought id
function ctf_bots:internal/learn/buy_add with storage ctf_bots:learn arg
