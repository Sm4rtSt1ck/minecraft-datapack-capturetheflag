# As a bot shooting the player tagged bot_want from where it stands (bot_stance: its shots go to the
# player bot.shot, ctf_bots:internal/combat/target): its ranged weapon in hand; a melee enemy closer
# than #kd bots: it backs off / steps aside (ctf_bots:internal/duel/kite); else on guard (NoAI: it
# doesn't run at him), turned to him
scoreboard players operation @s bot.shot = @p[tag=bot_want] player_id
tag @s add bot_stance
function ctf_bots:internal/combat/ranged
execute if score #eranged bots matches 0 if score #dist bots <= #kd bots if function ctf_bots:internal/duel/kite run return 1
function ctf_bots:internal/brain/guard
tp @s ~ ~ ~ facing entity @p[tag=bot_want] eyes
return 1
