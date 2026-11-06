# The graph is ready (the fields computed again); the lobby view reports it to its viewers
function ctf_bots:internal/nav/invalidate
scoreboard players set #ready nav 1
execute if score #lshow nav matches 1 run function ctf_bots:internal/nav/show_count
