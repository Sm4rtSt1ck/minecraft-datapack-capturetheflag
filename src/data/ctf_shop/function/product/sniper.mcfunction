# Sniper rifle (ctf_sniper) + its rounds (slot 7, see ctf_inv:ammo/fill_all). cost
$execute store result score #ok shop.tmp run function ctf_shop:buy/group {\
    item: "spyglass", \
    name: '{"text": "Sniper rifle", "color": "dark_red", "italic": false}', \
    components: "lore=['{\"text\": \"Hold right click to aim, release to shoot\", \"color\": \"gray\", \"italic\": false}', '{\"text\": \"Switch the slot to cancel the shot\", \"color\": \"gray\", \"italic\": false}', '{\"text\": \"Ammo: sniper rounds\", \"color\": \"gray\", \"italic\": false}']", \
    count: 1, \
    cost: $(cost), \
    group: "secondary weapon", \
    wpn: "sniper", \
    bind: "1b", \
    offhand: 0, \
    free: 0\
}
execute if score #ok shop.tmp matches 1 run function ctf_inv:ammo/fill_all
