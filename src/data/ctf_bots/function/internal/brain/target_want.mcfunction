# As a bot: its target is the player tagged bot_want (chased even out of sight), only when it isn't
# already (ctf_bots:internal/brain/aim_player)
execute if entity @s[tag=bot_guard] run function ctf_bots:internal/brain/unguard
scoreboard players set #ok bots 0
execute on target if entity @s[tag=bot_want] run scoreboard players set #ok bots 1
execute if score #ok bots matches 1 run return 1
function ctf_bots:internal/brain/aim_player
