# 1 if the player carries the flag (banner after breaking, armor stand item in freeze)
execute if items entity @s container.* magenta_banner run return 1
execute if items entity @s container.* armor_stand run return 1
execute if items entity @s player.cursor magenta_banner run return 1
execute if items entity @s player.cursor armor_stand run return 1
return 0
