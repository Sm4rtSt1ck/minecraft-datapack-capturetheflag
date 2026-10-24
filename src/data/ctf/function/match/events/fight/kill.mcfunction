# Loot crate tasks (before the teamkill scores are reset)
function ctf_loot:on_kill
function ctf_econ:kill
scoreboard players set @s tk.red 0
scoreboard players set @s tk.blue 0

title @s title ""
title @s subtitle {"text": "KILL", "color": "red"}

execute positioned as @s run playsound entity.player.levelup ambient @s ~ ~ ~ 1 1.5

function ctf:match/events/ultimate/add_point {points: 40}

tag @s add just_killed

scoreboard players set @s just_killed 0
