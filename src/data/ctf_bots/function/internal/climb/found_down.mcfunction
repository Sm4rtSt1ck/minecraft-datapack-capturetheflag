# As a bot, positioned above the top block of a ladder down near it (ctf_bots:internal/climb/search_down_near):
# like ctf_bots:internal/climb/found, then it goes down (bot_godown: ctf_bots:internal/climb/start_down)
function ctf_bots:internal/climb/found
tag @s add bot_godown
return 1
