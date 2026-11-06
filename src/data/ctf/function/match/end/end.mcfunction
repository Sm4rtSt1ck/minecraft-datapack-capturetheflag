from registry:world import ARENA
function admin:log/function {name: "match/end/end"}

# Modules: the match ends, before the arena is cleaned (what the bots learned is saved)
function #ctf:on/match_ending

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

forceload remove (ARENA["corner"][0]) (ARENA["corner"][2]) (ARENA["corner"][0] + ARENA["size"][0]) (ARENA["corner"][2] + ARENA["size"][2])

tellraw @a [{"text": "If something went wrong, ", "color": "#ff8800"},\
            {"text": "click here", \
             "clickEvent": {"action": "run_command", "value": "/function ctf:set_parameters"},\
             "hoverEvent": {"action": "show_text", "contents": "*click*"}, "color": "red"},\
            {"text": ". This will reset the datapack settings.", "color": "#ff8800"}]

# Modules: everyone goes to the lobby
function #ctf:on/match_end
