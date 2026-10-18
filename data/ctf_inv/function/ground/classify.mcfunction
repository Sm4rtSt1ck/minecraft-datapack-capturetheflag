# Runs once per item entity (the first tick it exists)
tag @s add ctf.seen

# UI and fixed items can't be dropped
execute if items entity @s contents *[custom_data~{ctf_ui:{}}] run return run kill @s
execute if items entity @s contents *[custom_data~{ctf_craft:{}}] run return run kill @s
execute if items entity @s contents *[custom_data~{action:"exit"}] run return run kill @s
execute if items entity @s contents *[custom_data~{action:"ultimate"}] run return run kill @s
execute if items entity @s contents stick run return run kill @s

# Restricted pickup (see ctf_inv:ground/tick)
execute if items entity @s contents yellow_banner run return run tag @s add ctf.r.banner
execute if items entity @s contents armor_stand run return run tag @s add ctf.r.flag
execute if items entity @s contents *[custom_data~{tags:["main weapon"]}] run return run tag @s add ctf.r.main
execute if items entity @s contents *[custom_data~{tags:["secondary weapon"]}] run return run tag @s add ctf.r.sec
execute if items entity @s contents *[custom_data~{tags:["he_grenade"]}] run return run tag @s add ctf.r.he
execute if items entity @s contents *[custom_data~{tags:["shield or totem"]}] run return run tag @s add ctf.r.guard
execute if items entity @s contents *[custom_data~{ammo:"bow"}] run return run tag @s add ctf.r.ammo_bow
execute if items entity @s contents *[custom_data~{ammo:"fire_bow"}] run return run tag @s add ctf.r.ammo_fire_bow
execute if items entity @s contents *[custom_data~{ammo:"punch_bow"}] run return run tag @s add ctf.r.ammo_punch_bow
execute if items entity @s contents *[custom_data~{ammo:"power_bow"}] run return run tag @s add ctf.r.ammo_power_bow
execute if items entity @s contents *[custom_data~{ammo:"sniper"}] run return run tag @s add ctf.r.ammo_sniper
execute if items entity @s contents *[custom_data~{ammo:"crossbow"}] run return run tag @s add ctf.r.ammo_crossbow
execute if items entity @s contents wind_charge run return run tag @s add ctf.r.wind
execute if items entity @s contents potion[custom_data~{lim:"regen"}] run return run tag @s add ctf.r.regen
execute if items entity @s contents potion[custom_data~{lim:"speed"}] run return run tag @s add ctf.r.speed
execute if items entity @s contents chorus_fruit run return run tag @s add ctf.r.chorus
execute if items entity @s contents #ctf_inv:offhand run return run tag @s add ctf.r.off
tag @s add ctf.r.free
