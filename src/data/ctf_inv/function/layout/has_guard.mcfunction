# 1 if the player already owns an item of the group "shield or totem"
execute if items entity @s container.* *[custom_data~{tags:["shield or totem"]}] run return 1
execute if items entity @s weapon.offhand *[custom_data~{tags:["shield or totem"]}] run return 1
execute if items entity @s player.cursor *[custom_data~{tags:["shield or totem"]}] run return 1
execute if items entity @s player.crafting.* *[custom_data~{tags:["shield or totem"]}] run return 1
return 0
