# function ctf:set_parameters

# Loading notification
title @a[tag=admin] title { \
    "text": "Datapack loaded!", \
    "color": "green", \
    "bold": true \
}
execute as @a[tag=admin] positioned as @s run \
    playsound entity.firework_rocket.launch master @s ~ ~ ~ 1 1
