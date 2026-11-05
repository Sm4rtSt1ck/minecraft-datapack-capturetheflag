# The bot count sign (click): 1 -> 2 -> ... -> 10 -> 1
# The coordinates: registry/world.bolt
from registry:world import LOBBY

scoreboard players add Bots_count settings 1
execute if score Bots_count settings matches 11.. run scoreboard players set Bots_count settings 1

setblock (LOBBY["sign_bots"][0]) (LOBBY["sign_bots"][1]) (LOBBY["sign_bots"][2]) air
setblock (LOBBY["sign_bots"][0]) (LOBBY["sign_bots"][1]) (LOBBY["sign_bots"][2]) cherry_wall_sign{\
    front_text:{\
        messages:[\
            '{"text":"BOTS", "color": "gold", "bold": true, "shadow_color":-7513088}',\
            '{"text":"Default: 5"}',\
            '{"text":""}',\
            '{\
                "score": {"name": "Bots_count", "objective": "settings"},\
                "shadow_color":-16747111,\
                "color":"#00e1ff",\
                "bold": true,\
                "clickEvent":{"action":"run_command","value":"/function ctf_lobby:internal/settings/bots_count"}\
            }'\
        ]\
    }\
} replace
