scoreboard players remove end timer 1
execute store result bossbar ctf:match value run scoreboard players get end timer

clear @a[tag=player, nbt=!{Inventory:[{Slot:8b, components:{"minecraft:custom_data":{action:"exit"}}}]}] carrot_on_a_stick[custom_data={action:"exit"}]
item replace entity @a[tag=player] hotbar.8 with carrot_on_a_stick[item_model="minecraft:red_bed", custom_name='[{"text":"EXIT TO LOBBY [", "color": "red", "bold": true, "italic": false}, {"keybind":"key.use"}, {"text": "]"}]',custom_data={action:"exit"}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{action:"exit"}}}}]

execute if score end timer matches -2147483648..0 run function ctf:match/end/end
