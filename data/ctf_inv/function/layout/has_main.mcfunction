# 1 if the player already owns an item of the group "main weapon"
execute if items entity @s container.* *[custom_data~{tags:["main weapon"]}] run return 1
execute if items entity @s weapon.offhand *[custom_data~{tags:["main weapon"]}] run return 1
execute if items entity @s player.cursor *[custom_data~{tags:["main weapon"]}] run return 1
execute if items entity @s player.crafting.* *[custom_data~{tags:["main weapon"]}] run return 1
return 0
