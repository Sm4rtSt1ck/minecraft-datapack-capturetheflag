# Settings of the modules: loaded on every /reload and world load (and again at match start),
# so changes of the config files apply right away
function ctf_econ:config
function ctf_guns:config
function ctf_sniper:config
function ctf_loot:config
function ctf:match/helpers/flag/config

# Loading notification
title @a[tag=admin] title { \
    "text": "Datapack loaded!", \
    "color": "green", \
    "bold": true \
}
execute as @a[tag=admin] positioned as @s run \
    playsound entity.firework_rocket.launch master @s ~ ~ ~ 1 1

tellraw @a [{"text": "If something went wrong, ", "color": "#ff8800"},\
            {"text": "click here", \
             "clickEvent": {"action": "run_command", "value": "/function ctf:set_parameters"},\
             "hoverEvent": {"action": "show_text", "contents": "*click*"}, "color": "red"},\
            {"text": ". This will reset the datapack settings.", "color": "#ff8800"}]
