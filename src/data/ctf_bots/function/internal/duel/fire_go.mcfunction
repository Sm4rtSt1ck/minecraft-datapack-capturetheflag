# As a bot shooting the seen enemy tagged bot_cand on the move (its ranged weapon in hand; its way goes on)
scoreboard players operation @s bot.shot = @p[tag=bot_cand] player_id
tag @s add bot_stance
function ctf_bots:internal/combat/ranged
return 1
