function admin:log/function {name: "match/prepare/prepare"}

title @a[tag=!lobby] subtitle {"text":"Preparing the map...", "color": "yellow"}

kill @e[tag=clone_marker]
function ctf_maps:api/call_current {function: "prepare"}

schedule function ctf_maps:internal/prepare/prepare_2 20t
