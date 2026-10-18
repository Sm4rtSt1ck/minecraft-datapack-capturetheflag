# 1 if one of the free hotbar slots (4-6) is empty
execute unless items entity @s hotbar.3 * run return 1
execute unless items entity @s hotbar.4 * run return 1
execute unless items entity @s hotbar.5 * run return 1
return 0
