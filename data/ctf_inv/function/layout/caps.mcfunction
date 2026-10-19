# Tags ctf.can.<kind>: the player may pick up an item of this kind from the ground
tag @s remove ctf.can.main
tag @s remove ctf.can.sec
tag @s remove ctf.can.he
tag @s remove ctf.can.guard
tag @s remove ctf.can.free
tag @s remove ctf.can.off
tag @s remove ctf.can.flag
tag @s remove ctf.can.regen
tag @s remove ctf.can.speed
tag @s remove ctf.can.chorus
tag @s remove ctf.can.smoke
tag @s remove ctf.can.armor
tag @s remove ctf.can.helmet
tag @s remove ctf.can.trap_def
tag @s remove ctf.can.trap_att

execute unless function ctf_inv:layout/has_main run tag @s add ctf.can.main
execute unless function ctf_inv:layout/has_sec run tag @s add ctf.can.sec
execute unless function ctf_inv:layout/has_he run tag @s add ctf.can.he
execute unless function ctf_inv:layout/has_guard run tag @s add ctf.can.guard
execute if function ctf_inv:api/has_free_slot run tag @s add ctf.can.free
execute unless items entity @s weapon.offhand * run tag @s add ctf.can.off
execute if entity @s[tag=ctf.can.free] run tag @s add ctf.can.off
# Limited items: only below the carry limit (otherwise they would be dropped right away)
function ctf_inv:limits/count {pred: 'potion[custom_data~{lim:"regen"}]'}
execute if score #n inv.tmp matches ..0 if entity @s[tag=ctf.can.free] run tag @s add ctf.can.regen
function ctf_inv:limits/count {pred: 'potion[custom_data~{lim:"speed"}]'}
execute if score #n inv.tmp matches ..0 if entity @s[tag=ctf.can.free] run tag @s add ctf.can.speed
function ctf_inv:limits/count {pred: 'chorus_fruit'}
execute if score #n inv.tmp matches ..2 if entity @s[tag=ctf.can.free] run tag @s add ctf.can.chorus
execute if score #n inv.tmp matches 1..2 run tag @s add ctf.can.chorus

# Ammo and wind charges
function ctf_inv:ammo/caps_all

function ctf_inv:limits/count {pred: '*[custom_data~{tags:["smoke_grenade"]}]'}
execute if score #n inv.tmp matches ..0 if entity @s[tag=ctf.can.free] run tag @s add ctf.can.smoke

# Traps: only for their team
execute if entity @s[tag=defense, tag=ctf.can.free] run tag @s add ctf.can.trap_def
execute if entity @s[tag=attack, tag=ctf.can.free] run tag @s add ctf.can.trap_att

# Armor: only into an empty armor slot
execute unless items entity @s armor.chest * run tag @s add ctf.can.armor
execute unless items entity @s armor.head * run tag @s add ctf.can.helmet

# Flag in freeze: any defender (the flag pushes out whatever lies in slot 8)
execute if entity @s[tag=defense] if score game state = freeze state run tag @s add ctf.can.flag
