# A ladder down near the node A (ctf_bots:internal/nav/search_down), positioned above its top block:
# down to the floor (ctf_bots:internal/nav/climb_down: #lh nav = the height)
scoreboard players set #lh nav 0
function ctf_bots:internal/nav/climb_down
return 1
