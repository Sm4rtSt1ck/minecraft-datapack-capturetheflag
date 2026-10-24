# Death camera for you, looking at the nearest other player (as if he killed you).
# You become a spectator: /gamemode creative to get back
scoreboard players reset @s dc.killer
execute store result score @s dc.killer run scoreboard players get @p[distance=0.1..] player_id
gamemode spectator @s
execute at @s run function ctf:match/events/fight/deathcam/start
execute unless score @s dc.killer matches 1.. run tellraw @s {"text": "No other player nearby to look at (needs a player_id)", "color": "red"}
