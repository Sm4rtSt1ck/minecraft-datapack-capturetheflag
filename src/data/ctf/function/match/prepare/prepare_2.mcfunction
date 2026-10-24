function admin:log/function {name: "match/prepare/prepare_2"}

execute positioned as @e[tag=clone_marker] run forceload add ~ ~ ~127 ~127

schedule function ctf:match/prepare/clone 20t
