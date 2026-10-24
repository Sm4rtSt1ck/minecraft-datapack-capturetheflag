# The duration: registry ULTIMATES
from registry:ultimates import ult
scoreboard players set @s timer ult("bomber")["duration"]

item replace entity @s armor.head with tnt[enchantments={levels:{"minecraft:binding_curse":1},show_in_tooltip:false}, custom_data={tags:["ultimate"]}]
execute positioned as @s run playsound entity.tnt.primed player @a[tag=player] ~ ~ ~ 20 0.8

tag @s add bomber
