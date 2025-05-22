function admin:log/function {name: "match/maps/night_club/prepare"}

title @s title [{"text": "Night", "color": "dark_purple"}, {"text": "Club", "color": "light_purple"}]

forceload add 150 100
summon armor_stand 150.5 -54 100.5 {Marker:true, Tags:["clone_marker"]}
