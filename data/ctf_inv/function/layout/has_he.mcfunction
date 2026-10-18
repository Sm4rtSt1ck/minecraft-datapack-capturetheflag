# 1 if the player already owns an item of the group "he_grenade"
execute if items entity @s container.* *[custom_data~{tags:["he_grenade"]}] run return 1
execute if items entity @s weapon.offhand *[custom_data~{tags:["he_grenade"]}] run return 1
execute if items entity @s player.cursor *[custom_data~{tags:["he_grenade"]}] run return 1
execute if items entity @s player.crafting.* *[custom_data~{tags:["he_grenade"]}] run return 1
return 0
