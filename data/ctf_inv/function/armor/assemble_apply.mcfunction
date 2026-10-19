# mat, extra, feet, feet_extra, max, dmg, sid
$item modify entity @s armor.chest {function: "minecraft:set_custom_data", tag: "{ctf_set:{sid:$(sid)}}"}
$item replace entity @s armor.legs with minecraft:$(mat)_leggings[$(extra)max_damage=$(max), damage=$(dmg), custom_data={ctf_part:1b, sid:$(sid)}]
$item replace entity @s armor.feet with minecraft:$(feet)[$(feet_extra)max_damage=$(max), damage=$(dmg), custom_data={ctf_part:1b, sid:$(sid)}]
