#########################################
# EVENTS HANDLING

execute as @a[tag=lobby, scores={just_died=1..}] run function ctf:lobby/events/die

#########################################
# OTHER

kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{tags:["menu"]}}}}]
