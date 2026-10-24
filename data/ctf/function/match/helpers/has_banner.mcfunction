# 1 if the player has the flag banner anywhere in his inventory (the slots of the Inventory NBT)
execute if items entity @s container.* magenta_banner run return 1
execute if items entity @s armor.* magenta_banner run return 1
execute if items entity @s weapon.offhand magenta_banner run return 1
return 0
