scoreboard players set @s timer 300

item replace entity @s armor.head with tnt[custom_data={tags:["ultimate"]}]
execute positioned as @s run playsound entity.tnt.primed player @a[tag=player] ~ ~ ~ 20 0.8

tag @s add bomber
