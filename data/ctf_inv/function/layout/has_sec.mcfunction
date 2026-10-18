# 1 if the player already owns an item of the group "secondary weapon"
execute if items entity @s container.* *[custom_data~{tags:["secondary weapon"]}] run return 1
execute if items entity @s weapon.offhand *[custom_data~{tags:["secondary weapon"]}] run return 1
execute if items entity @s player.cursor *[custom_data~{tags:["secondary weapon"]}] run return 1
execute if items entity @s player.crafting.* *[custom_data~{tags:["secondary weapon"]}] run return 1
return 0
