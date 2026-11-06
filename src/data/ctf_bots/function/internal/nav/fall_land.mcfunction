# A walk test landed after a fall of #fh nav blocks (the highest fall of the link: #fall nav)
scoreboard players set #drop nav 1
execute if score #fh nav > #fall nav run scoreboard players operation #fall nav = #fh nav
execute if score #mode nav matches 2 run return run function ctf_bots:internal/nav/gap_end
function ctf_bots:internal/nav/walk_on
