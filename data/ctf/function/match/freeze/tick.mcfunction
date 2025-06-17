scoreboard players remove freeze timer 1
execute store result bossbar ctf:match value run scoreboard players get freeze timer

execute if score freeze timer matches 200 run title @a[tag=!lobby] title {"text": "10 SECONDS", "color": "green"}
execute if score freeze timer matches 200 as @a[tag=!lobby] at @s run playsound minecraft:entity.experience_orb.pickup ambient @s ~ ~ ~ 1 0.4
execute if score freeze timer matches 60 run title @a[tag=!lobby] title {"text": "❸", "color": "green"}
execute if score freeze timer matches 60 as @a[tag=!lobby] at @s run playsound minecraft:entity.experience_orb.pickup ambient @s ~ ~ ~ 1 0.6
execute if score freeze timer matches 40 run title @a[tag=!lobby] title {"text": "❷", "color": "green"}
execute if score freeze timer matches 40 as @a[tag=!lobby] at @s run playsound minecraft:entity.experience_orb.pickup ambient @s ~ ~ ~ 1 0.8
execute if score freeze timer matches 20 run title @a[tag=!lobby] title {"text": "❶", "color": "green"}
execute if score freeze timer matches 20 as @a[tag=!lobby] at @s run playsound minecraft:entity.experience_orb.pickup ambient @s ~ ~ ~ 1 1

# execute if score freeze timer matches 60 as @a[tag=attack] run function ctf:match/freeze/spread_attackers
# execute if score freeze timer matches ..60 as @a[tag=attack] run function ctf:match/freeze/attackers_appearance

# execute at @e[type=tnt] run summon armor_stand ~ ~ ~ {Tags:["tnt_marker"], Marker:true}
# kill @e[type=tnt]
# execute at @e[type=armor_stand,tag=tnt_marker] run setblock ~ ~ ~ tnt
# kill @e[type=armor_stand, tag=tnt_marker]

# execute as @a[scores={just_died=1..}] run function ctf:match/events/fight/die
execute as @a[scores={flag_placed=1..}] run function ctf:match/events/flag/place
execute as @a[scores={just_placed_trap=1..}] run function ctf:match/events/traps/place
execute as @a[scores={just_used_chorus=1..}] run function ctf:match/events/misc/chorus/chorus
execute as @a[scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[minecraft:custom_data={tags:["trap", "detector"]}] run function ctf:match/events/traps/detector/place
execute as @e[tag=trap_display] positioned as @s unless entity @n[tag=trap_marker, distance=1.2..1.5] run kill @s

# Grenades
execute as @a[scores={just_threw_grenade=1..}] run function ctf:match/events/grenades/throw
execute as @e[type=armor_stand, tag=he_grenade] run function ctf:match/events/grenades/fly

# Restrict picking up
function ctf:match/helpers/pickup_restrict

# ATTACK TEAM TRAPS
function ctf:match/events/traps/detector/trigger

# ULTIMATE
execute as @a[tag=player, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[minecraft:custom_data={action:"ultimate"}] run function ctf:match/events/ultimate/check_points

function ctf:match/freeze/shop/tick

clear @a[tag=player, nbt=!{Inventory:[{Slot:8b, components:{"minecraft:custom_data":{action:"exit"}}}]}] carrot_on_a_stick[custom_data={action:"exit"}]
item replace entity @a[tag=player] hotbar.8 with carrot_on_a_stick[item_model="minecraft:red_bed", custom_name='[{"text":"Exit to lobby ["}, {"keybind":"key.use"}, {"text": "]"}]',custom_data={action:"exit"}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{action:"exit"}}}}]

clear @a[tag=player, nbt=!{Inventory:[{Slot:7b, components:{"minecraft:custom_data":{action:"ultimate"}}}]}] carrot_on_a_stick[custom_data={action:"ultimate"}]
item replace entity @a[tag=player, scores={ultimate_category=0}] hotbar.7 with carrot_on_a_stick[item_model="minecraft:blaze_rod", custom_name='[{"text":"ULTIMATE (Default) [", "color": "#f94bff", "bold": true, "italic": false, "shadow_color": -8379784}, {"keybind":"key.use"}, {"text": "]"}]',custom_data={action:"ultimate"}]
item replace entity @a[tag=player, scores={ultimate_category=1}] hotbar.7 with carrot_on_a_stick[item_model="minecraft:skeleton_skull", custom_name='[{"text":"ULTIMATE (Ghost) [", "color": "#f94bff", "bold": true, "italic": false, "shadow_color": -8379784}, {"keybind":"key.use"}, {"text": "]"}]',custom_data={action:"ultimate"}]
item replace entity @a[tag=player, scores={ultimate_category=2}] hotbar.7 with carrot_on_a_stick[item_model="minecraft:armadillo_scute", custom_name='[{"text":"ULTIMATE (Microman) [", "color": "#f94bff", "bold": true, "italic": false, "shadow_color": -8379784}, {"keybind":"key.use"}, {"text": "]"}]',custom_data={action:"ultimate"}]
item replace entity @a[tag=player, scores={ultimate_category=3}] hotbar.7 with carrot_on_a_stick[item_model="minecraft:trident", custom_name='[{"text":"ULTIMATE (Piercing killer) [", "color": "#f94bff", "bold": true, "italic": false, "shadow_color": -8379784}, {"keybind":"key.use"}, {"text": "]"}]',custom_data={action:"ultimate"}]
item replace entity @a[tag=player, scores={ultimate_category=4}] hotbar.7 with carrot_on_a_stick[item_model="minecraft:tnt", custom_name='[{"text":"ULTIMATE (Suicide bomber) [", "color": "#f94bff", "bold": true, "italic": false, "shadow_color": -8379784}, {"keybind":"key.use"}, {"text": "]"}]',custom_data={action:"ultimate"}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{action:"ultimate"}}}}]

execute if score freeze timer matches -2147483648..0 run function ctf:match/round/start
