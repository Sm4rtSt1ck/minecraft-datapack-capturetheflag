execute at @s positioned as @n[type=potion,nbt={Item:{components:{"minecraft:custom_data":{tags:["he_grenade"]}}}}] run summon minecraft:armor_stand ~ ~ ~ {Marker: true, Invisible: true, Tags: ["he_grenade"]}

scoreboard players set @s just_threw_grenade 0
