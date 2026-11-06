# As a candidate player (positioned at the bot's feet): the ray from the bot's eyes to his eyes
# (ctf_bots:internal/sense/los)
scoreboard players set #step bots 0
execute positioned ~ ~1.75 ~ facing entity @s eyes positioned ^ ^ ^1 run function ctf_bots:internal/sense/los
