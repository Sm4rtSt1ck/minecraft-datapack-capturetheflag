# owner, reward_item
$execute as @a if score @s player_id matches $(owner) run give @s $(reward_item)
$execute as @a if score @s player_id matches $(owner) at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.6 1.6
