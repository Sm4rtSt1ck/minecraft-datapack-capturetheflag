function admin:log/function {name: "match/prepare/prepare"}

title @a[tag=!lobby] subtitle {"text":"Preparing the map...", "color": "yellow"}

kill @e[tag=clone_marker]
function ctf:match/maps/call_current {function: "prepare"}

schedule function ctf:match/prepare/prepare_2 20t
