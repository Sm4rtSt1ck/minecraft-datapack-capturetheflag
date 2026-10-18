execute unless score game state = freeze state at @s positioned as @n[type=potion,nbt={Item:{components:{"minecraft:custom_data":{tags:["he_grenade"]}}}}] run summon minecraft:armor_stand ~ ~ ~ {Marker: true, Invisible: true, Tags: ["he_grenade", "kc.new"]}
# Owner of the grenade (kill credit)
scoreboard players operation @e[type=armor_stand, tag=kc.new] kc.owner = @s player_id
tag @e[type=armor_stand, tag=kc.new] remove kc.new

execute if score game state = freeze state run give @s lingering_potion[\
    max_stack_size=64,\
    custom_name="\"Grenade\"",\
    custom_data={"tags": ["he_grenade"]}\
]
execute if score game state = freeze state run tellraw @s {"text": "You cannot use this now!", "color": "red"}
execute if score game state = freeze state positioned as @s run kill @n[type=potion]

scoreboard players set @s just_threw_grenade 0
