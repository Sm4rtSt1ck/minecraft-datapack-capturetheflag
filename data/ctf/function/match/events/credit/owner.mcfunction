# #owner kc.tmp = owner of the executing entity (no score -> no owner)
scoreboard players reset #owner kc.tmp
execute if score @s kc.owner matches -2147483648..2147483647 run scoreboard players operation #owner kc.tmp = @s kc.owner
