# MAP BUILDING: the bot annotation markers (BOTS.md stage 3), placed like the other build markers
# (spawn eggs of small armor stands; a creative hit removes one, admin:build/clear_markers all).
# The markers standing in the template ARE the bots' knowledge of the map: every clone of the map
# copies them into the arena. Only the markers of the kind held in the main hand glow.
#   F - flag spot, T - trap spot, AN - anvil trap spot (on a ceiling), D - defend spot (a D may be on a T)
#   R1..R4 - attack routes: the points of a route in the order they are placed (named R<route>.<n>);
#            to change the order, remove the route's markers and place them again
# admin:build/bots/dump prints a backup for registry/maps.bolt, admin:build/bots/show/<map> restores it
# The kinds: admin:modules/bot_markers.bolt (keep the same values)
# Only in the lobby
execute unless score game state = lobby state run return run function admin:build/internal/wrong_phase

give @s bat_spawn_egg[\
    item_model="minecraft:magenta_dye",\
    item_name='{"text": "Bot flag spot", "color": "light_purple"}',\
    lore=['{"text": "a defense bot may hide the flag here", "color": "gray", "italic": false}'],\
    entity_data={id: "minecraft:armor_stand", Tags: ["build_marker", "build_bot", "build_bot_flag"], ArmorItems: [{}, {}, {}, {id: "minecraft:magenta_concrete", count: 1}], Small: 1b, NoGravity: 1b, CustomNameVisible: 1b, CustomName: '{"text": "F", "color": "light_purple"}'}\
] 64
give @s bat_spawn_egg[\
    item_model="minecraft:orange_dye",\
    item_name='{"text": "Bot trap spot", "color": "gold"}',\
    lore=['{"text": "a defense bot may place a trap here", "color": "gray", "italic": false}'],\
    entity_data={id: "minecraft:armor_stand", Tags: ["build_marker", "build_bot", "build_bot_trap"], ArmorItems: [{}, {}, {}, {id: "minecraft:orange_concrete", count: 1}], Small: 1b, NoGravity: 1b, CustomNameVisible: 1b, CustomName: '{"text": "T", "color": "gold"}'}\
] 64
give @s bat_spawn_egg[\
    item_model="minecraft:brown_dye",\
    item_name='{"text": "Bot anvil trap spot", "color": "dark_red"}',\
    lore=['{"text": "an anvil trap here (on a ceiling): it falls on who passes below", "color": "gray", "italic": false}'],\
    entity_data={id: "minecraft:armor_stand", Tags: ["build_marker", "build_bot", "build_bot_anvil"], ArmorItems: [{}, {}, {}, {id: "minecraft:brown_concrete", count: 1}], Small: 1b, NoGravity: 1b, CustomNameVisible: 1b, CustomName: '{"text": "AN", "color": "dark_red"}'}\
] 64
give @s bat_spawn_egg[\
    item_model="minecraft:cyan_dye",\
    item_name='{"text": "Bot defend spot", "color": "dark_aqua"}',\
    lore=['{"text": "a defense bot may hold this position", "color": "gray", "italic": false}'],\
    entity_data={id: "minecraft:armor_stand", Tags: ["build_marker", "build_bot", "build_bot_defend"], ArmorItems: [{}, {}, {}, {id: "minecraft:cyan_concrete", count: 1}], Small: 1b, NoGravity: 1b, CustomNameVisible: 1b, CustomName: '{"text": "D", "color": "dark_aqua"}'}\
] 64
give @s bat_spawn_egg[\
    item_model="minecraft:lime_dye",\
    item_name='{"text": "Bot attack route 1", "color": "green"}',\
    lore=['{"text": "the next point of the route (in order)", "color": "gray", "italic": false}'],\
    entity_data={id: "minecraft:armor_stand", Tags: ["build_marker", "build_bot", "build_route", "build_route_1"], ArmorItems: [{}, {}, {}, {id: "minecraft:lime_concrete", count: 1}], Small: 1b, NoGravity: 1b, CustomNameVisible: 1b, CustomName: '{"text": "R1", "color": "green"}'}\
] 64
give @s bat_spawn_egg[\
    item_model="minecraft:yellow_dye",\
    item_name='{"text": "Bot attack route 2", "color": "yellow"}',\
    lore=['{"text": "the next point of the route (in order)", "color": "gray", "italic": false}'],\
    entity_data={id: "minecraft:armor_stand", Tags: ["build_marker", "build_bot", "build_route", "build_route_2"], ArmorItems: [{}, {}, {}, {id: "minecraft:yellow_concrete", count: 1}], Small: 1b, NoGravity: 1b, CustomNameVisible: 1b, CustomName: '{"text": "R2", "color": "yellow"}'}\
] 64
give @s bat_spawn_egg[\
    item_model="minecraft:light_blue_dye",\
    item_name='{"text": "Bot attack route 3", "color": "aqua"}',\
    lore=['{"text": "the next point of the route (in order)", "color": "gray", "italic": false}'],\
    entity_data={id: "minecraft:armor_stand", Tags: ["build_marker", "build_bot", "build_route", "build_route_3"], ArmorItems: [{}, {}, {}, {id: "minecraft:light_blue_concrete", count: 1}], Small: 1b, NoGravity: 1b, CustomNameVisible: 1b, CustomName: '{"text": "R3", "color": "aqua"}'}\
] 64
give @s bat_spawn_egg[\
    item_model="minecraft:pink_dye",\
    item_name='{"text": "Bot attack route 4", "color": "light_purple"}',\
    lore=['{"text": "the next point of the route (in order)", "color": "gray", "italic": false}'],\
    entity_data={id: "minecraft:armor_stand", Tags: ["build_marker", "build_bot", "build_route", "build_route_4"], ArmorItems: [{}, {}, {}, {id: "minecraft:pink_concrete", count: 1}], Small: 1b, NoGravity: 1b, CustomNameVisible: 1b, CustomName: '{"text": "R4", "color": "light_purple"}'}\
] 64
