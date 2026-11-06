# As a bot with a target at the range of its ranged weapon: it holds it and shoots every tick
# (ctf_bots:tick/combat -> ctf_bots:internal/combat/shoot)
execute unless score @s bot.hold matches 1 run function ctf_bots:internal/combat/hold_ranged
tag @s add bot_shoot
