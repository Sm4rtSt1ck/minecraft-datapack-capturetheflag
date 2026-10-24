function admin:log/function {name: "match/maps/farm/prepare"}

forceload add 250 100
summon armor_stand 250 -52 100 {Marker:true, Tags:["clone_marker"]}

# Fix dirt path bug
fill -146 -50 -156 -182 -50 -123 air replace dirt_path
