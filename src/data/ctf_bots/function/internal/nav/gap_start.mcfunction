# A walk test (#mode 0): no floor 2 blocks below: a gap to jump over (one per link)
execute if score #jump nav matches 2 run return 0
scoreboard players set #jump nav 1
scoreboard players set #glen nav 0
# A deep hole (no floor 3 blocks down either): the far edge may also be 1-2 blocks lower; else it is
# a ledge (a drop, #mode 1)
scoreboard players set #deep nav 0
execute if block ~ ~-3 ~ #ctf_bots:gap run scoreboard players set #deep nav 1
function ctf_bots:internal/nav/gap_at
