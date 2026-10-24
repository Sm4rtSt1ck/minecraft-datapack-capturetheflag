# Runs in the layout check. Nothing to do without ammo
execute unless items entity @s container.* *[custom_data~{ctf_ammo:1b}] unless items entity @s weapon.offhand *[custom_data~{ctf_ammo:1b}] unless items entity @s player.cursor *[custom_data~{ctf_ammo:1b}] run return 0
function ctf_inv:ammo/check {type: "bow", max: 30}
function ctf_inv:ammo/check {type: "fire_bow", max: 24}
function ctf_inv:ammo/check {type: "punch_bow", max: 24}
function ctf_inv:ammo/check {type: "rifle", max: 90}
function ctf_inv:ammo/check {type: "sniper", max: 20}
function ctf_inv:ammo/check {type: "crossbow", max: 5}
function ctf_inv:ammo/check {type: "creep", max: 3}
