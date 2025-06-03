execute at @s positioned as @n[type=potion,nbt={Item:{components:{"minecraft:custom_data":{tags:["he_grenade"]}}}}] run summon minecraft:armor_stand ~ ~ ~ {Marker: true, Invisible: true, Tags: ["he_grenade"]}

execute if score game state = freeze state run give @s lingering_potion[\
  max_stack_size=64,\
  custom_name="\"Grenade\"",\
  custom_data={"tags": ["he_grenade"]}\
]
execute if score game state = freeze state run tellraw @s {"text": "You cannot use this now!", "color": "red"}

scoreboard players set @s just_threw_grenade 0
