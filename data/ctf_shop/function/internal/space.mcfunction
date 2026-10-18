# Is there a place for the bought item? Returns 1/0.
# offhand: 1 - put into the offhand if it's empty (result in #off shop.tmp)
# free:    1 - otherwise a free hotbar slot (4-6) is needed
#          0 - the item has its own slot (primary, secondary, grenade)
$scoreboard players set #off shop.tmp $(offhand)
execute if score #off shop.tmp matches 1 if items entity @s weapon.offhand * run scoreboard players set #off shop.tmp 0
execute if score #off shop.tmp matches 1 run return 1

$scoreboard players set #free shop.tmp $(free)
execute if score #free shop.tmp matches 0 run return 1
execute if function ctf_inv:api/has_free_slot run return 1
return 0
