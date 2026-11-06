# As a player: his purchase context now (lrn.ctx: ctf_bots:internal/learn/ctx; his money, his side, his
# team's rounds against the other's)
scoreboard players operation #money lrn = @s money
scoreboard players set #side lrn 0
execute if entity @s[tag=defense] run scoreboard players set #side lrn 1
scoreboard players set #my lrn 0
scoreboard players set #en lrn 0
execute if entity @s[team=team_1] run scoreboard players operation #my lrn = team_1 rounds
execute if entity @s[team=team_1] run scoreboard players operation #en lrn = team_2 rounds
execute if entity @s[team=team_2] run scoreboard players operation #my lrn = team_2 rounds
execute if entity @s[team=team_2] run scoreboard players operation #en lrn = team_1 rounds
function ctf_bots:internal/learn/ctx
scoreboard players operation @s lrn.ctx = #ctx lrn
