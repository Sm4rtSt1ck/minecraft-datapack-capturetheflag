# Every tick, as a bot with the jump armed: the edge checked (ctf_bots:internal/brain/leap_check);
# jumped (in the air) or the time over: disarmed
scoreboard players remove @s bot.lt 1
function ctf_bots:internal/brain/leap_check
execute unless predicate {condition: "minecraft:entity_properties", entity: "this", predicate: {flags: {is_on_ground: true}}} run scoreboard players set @s bot.lt 0
execute if score @s bot.lt matches ..0 run tag @s remove bot_leap
