# As a bot, at the flag: its way there (bot.pf), the shortest so far (#best bots)
function ctf_bots:internal/team/path
scoreboard players operation @s bot.pf = #path bots
execute if score #path bots < #best bots run scoreboard players operation #best bots = #path bots
