function admin:log/function {name: "match/end/end"}

tag team_1 remove attack
tag team_1 remove defense
tag team_2 remove attack
tag team_2 remove defense

kill @e[tag=flag]
kill @e[tag=trap]
kill @e[tag=map_entity]
kill @e[tag=win_trigger]
kill @e[tag=spawn_spot]
kill @e[tag=inventory]

forceload remove -200 -200 -72 -72

tellraw @a [{"text": "If something went wrong, ", "color": "#ff8800"},\
            {"text": "click here", \
             "clickEvent": {"action": "run_command", "value": "/function ctf:set_parameters"},\
             "hoverEvent": {"action": "show_text", "contents": "*click*"}, "color": "red"},\
            {"text": ". This will reset the datapack settings.", "color": "#ff8800"}]

function ctf:lobby/join_all
