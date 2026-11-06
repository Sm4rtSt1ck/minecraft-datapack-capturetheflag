# As a bot buying at freeze (learning on): like the players of its context (its money, side, the score:
# ctf_bots:internal/learn/buy_ctx); 1 when it did, 0: its plans
execute unless score Bots_learn settings matches 1 run return 0
execute as @e[type=marker, tag=bot_mywallet] run function ctf_bots:internal/learn/wallet_clear
scoreboard players operation #money lrn = @s money
scoreboard players set #side lrn 0
execute if entity @s[tag=defense] run scoreboard players set #side lrn 1
scoreboard players set #my lrn 0
scoreboard players set #en lrn 0
execute if score team bots matches 1 run scoreboard players operation #my lrn = team_1 rounds
execute if score team bots matches 1 run scoreboard players operation #en lrn = team_2 rounds
execute if score team bots matches 2 run scoreboard players operation #my lrn = team_2 rounds
execute if score team bots matches 2 run scoreboard players operation #en lrn = team_1 rounds
function ctf_bots:internal/learn/ctx
scoreboard players operation @e[type=marker, tag=bot_mywallet] lrn.ctx = #ctx lrn
data modify storage ctf_bots:learn arg set value {ctx: 0}
execute store result storage ctf_bots:learn arg.ctx int 1 run scoreboard players get #ctx lrn
return run function ctf_bots:internal/learn/buy_ctx
