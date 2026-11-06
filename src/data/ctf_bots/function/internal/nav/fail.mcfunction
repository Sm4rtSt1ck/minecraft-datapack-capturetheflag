# As a bot that didn't get along its link in time (or stuck on it): the link costs NAV "penalty" more
# (ctf_bots:internal/nav/penalize: every field is computed again), a new entry: another way
scoreboard players operation #cn nav = @s bot.cn
scoreboard players operation #nn nav = @s bot.nn
scoreboard players set #pen nav 0
execute if score #cn nav matches 1.. as @e[type=marker, tag=nav_node] if score @s nav.id = #cn nav at @s as @e[type=marker, tag=nav_link, distance=..0.1] if score @s nav.to = #nn nav run function ctf_bots:internal/nav/penalize
execute if score #pen nav matches 1 run function ctf_bots:internal/talk/blocked
scoreboard players operation #la nav = #cn nav
scoreboard players operation #lb nav = #nn nav
execute if score #cn nav matches 1.. run function ctf_bots:internal/learn/bot_link {f: "f"}
function ctf_bots:internal/nav/reset
