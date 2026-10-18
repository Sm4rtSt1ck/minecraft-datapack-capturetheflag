# Assault rifle (ctf_guns) + full magazine + reserve rounds (slot 7, see ctf_inv:ammo/fill_all). cost
# "consumable" with an endless use time: holding right click "uses" it, ctf_guns:rifle_use fires
$execute store result score #ok shop.tmp run function ctf_shop:buy/group {\
    item: "iron_horse_armor", \
    name: '{"text": "Assault rifle", "color": "yellow", "italic": false}', \
    components: "consumable={consume_seconds: 1000000f, animation: \"bow\", has_consume_particles: false, sound: \"minecraft:intentionally_empty\"}, lore=['{\"text\": \"Hold right click to shoot (6 shots per second)\", \"color\": \"gray\", \"italic\": false}', '{\"text\": \"Sneak for better accuracy\", \"color\": \"gray\", \"italic\": false}', '{\"text\": \"Ammo: rifle rounds\", \"color\": \"gray\", \"italic\": false}']", \
    count: 1, \
    cost: $(cost), \
    group: "secondary weapon", \
    wpn: "rifle", \
    bind: "1b", \
    offhand: 0, \
    free: 0\
}
execute if score #ok shop.tmp matches 1 run function ctf_inv:ammo/fill_all
