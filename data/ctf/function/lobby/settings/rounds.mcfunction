execute if score Rounds_to_win settings matches 10 run scoreboard players set Rounds_to_win settings 0
execute if score Rounds_to_win settings matches 9 run scoreboard players set Rounds_to_win settings 10
execute if score Rounds_to_win settings matches 8 run scoreboard players set Rounds_to_win settings 9
execute if score Rounds_to_win settings matches 7 run scoreboard players set Rounds_to_win settings 8
execute if score Rounds_to_win settings matches 6 run scoreboard players set Rounds_to_win settings 7
execute if score Rounds_to_win settings matches 5 run scoreboard players set Rounds_to_win settings 6
execute if score Rounds_to_win settings matches 4 run scoreboard players set Rounds_to_win settings 5
execute if score Rounds_to_win settings matches 3 run scoreboard players set Rounds_to_win settings 4
execute if score Rounds_to_win settings matches 2 run scoreboard players set Rounds_to_win settings 3
execute if score Rounds_to_win settings matches 0 run scoreboard players set Rounds_to_win settings 2

scoreboard players operation swap rounds = Rounds_to_win settings
scoreboard players operation swap rounds -= 1 number

setblock 0 -40 28 air


setblock 0 -40 28 cherry_wall_sign{\
    front_text:{\
        messages:[\
            '{"text":"ROUNDS TO WIN", "color": "gold", "bold": true, "shadow_color":-7513088}',\
            '{"text":"Default: 6"}',\
            '{"text":""}',\
            '{\
                "score": {"name": "Rounds_to_win", "objective": "settings"},\
                "shadow_color":-16747111,\
                "color":"#00e1ff",\
                "bold": true,\
                "clickEvent":{"action":"run_command","value":"/function ctf:lobby/settings/rounds"}\
            }'\
        ]\
    }\
} replace
