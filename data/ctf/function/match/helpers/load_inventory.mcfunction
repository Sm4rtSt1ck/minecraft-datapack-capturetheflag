tag @s add loading_inventory

execute as @e[tag=inventory] if score @s player_id = @p[tag=loading_inventory] player_id run item replace entity @p[tag=loading_inventory] hotbar.0 from entity @s container.0
execute as @e[tag=inventory] if score @s player_id = @p[tag=loading_inventory] player_id run item replace entity @p[tag=loading_inventory] hotbar.1 from entity @s container.1
execute as @e[tag=inventory] if score @s player_id = @p[tag=loading_inventory] player_id run item replace entity @p[tag=loading_inventory] hotbar.2 from entity @s container.2
execute as @e[tag=inventory] if score @s player_id = @p[tag=loading_inventory] player_id run item replace entity @p[tag=loading_inventory] hotbar.3 from entity @s container.3
execute as @e[tag=inventory] if score @s player_id = @p[tag=loading_inventory] player_id run item replace entity @p[tag=loading_inventory] hotbar.4 from entity @s container.4
execute as @e[tag=inventory] if score @s player_id = @p[tag=loading_inventory] player_id run item replace entity @p[tag=loading_inventory] hotbar.5 from entity @s container.5
execute as @e[tag=inventory] if score @s player_id = @p[tag=loading_inventory] player_id run item replace entity @p[tag=loading_inventory] hotbar.6 from entity @s container.6
execute as @e[tag=inventory] if score @s player_id = @p[tag=loading_inventory] player_id run item replace entity @p[tag=loading_inventory] hotbar.7 from entity @s container.7
execute as @e[tag=inventory] if score @s player_id = @p[tag=loading_inventory] player_id run item replace entity @p[tag=loading_inventory] weapon.offhand from entity @s container.8
execute as @e[tag=inventory] if score @s player_id = @p[tag=loading_inventory] player_id run item replace entity @p[tag=loading_inventory] armor.head from entity @s container.9
execute as @e[tag=inventory] if score @s player_id = @p[tag=loading_inventory] player_id run item replace entity @p[tag=loading_inventory] armor.chest from entity @s container.10
execute as @e[tag=inventory] if score @s player_id = @p[tag=loading_inventory] player_id run item replace entity @p[tag=loading_inventory] armor.legs from entity @s container.11
execute as @e[tag=inventory] if score @s player_id = @p[tag=loading_inventory] player_id run item replace entity @p[tag=loading_inventory] armor.feet from entity @s container.12

execute as @e[tag=inventory] if score @s player_id = @p[tag=loading_inventory] player_id run kill @s

tag @s remove loading_inventory
