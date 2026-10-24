# The coordinates: registry/world.bolt
from registry:world import LOBBY

execute if score Music settings matches 0 run scoreboard players set Music settings 2
execute if score Music settings matches 1 run scoreboard players set Music settings 0
execute if score Music settings matches 2 run scoreboard players set Music settings 1

setblock (LOBBY["sign_music"][0]) (LOBBY["sign_music"][1]) (LOBBY["sign_music"][2]) air

execute if score Music settings matches 0 run \
    setblock (LOBBY["sign_music"][0]) (LOBBY["sign_music"][1]) (LOBBY["sign_music"][2]) cherry_wall_sign{\
        front_text:{\
            messages:[\
                '{"text":"MUSIC", "color": "gold", "bold": true, "shadow_color":-7513088}',\
                '"Default: ON"',\
                '{"text":""}',\
                '{\
                    "text":"OFF",\
                    "bold": true,\
                    "shadow_color":-10092544,\
                    "color":"red",\
                    "clickEvent":{"action":"run_command","value":"/function ctf_lobby:internal/settings/music"}\
                }'\
            ]\
        }\
    } replace
execute if score Music settings matches 1 run \
    setblock (LOBBY["sign_music"][0]) (LOBBY["sign_music"][1]) (LOBBY["sign_music"][2]) cherry_wall_sign{\
        front_text:{\
            messages:[\
                '{"text":"MUSIC", "color": "gold", "bold": true, "shadow_color":-7513088}',\
                '"Default: ON"',\
                '{"text":""}',\
                '{\
                    "text":"ON",\
                    "bold": true,\
                    "shadow_color":-16751104,\
                    "color":"green",\
                    "clickEvent":{"action":"run_command","value":"/function ctf_lobby:internal/settings/music"}\
                }'\
            ]\
        }\
    } replace

execute if score Music settings matches 0 run stopsound @a ambient
execute if score Music settings matches 1 run playsound minecraft:music_disc.relic ambient @a[tag=lobby] (LOBBY["music"][0]) (LOBBY["music"][1]) (LOBBY["music"][2]) 80 2
