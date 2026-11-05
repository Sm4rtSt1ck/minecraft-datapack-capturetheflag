# MAP BUILDING: the markers for admin:build/solid/* (spawn eggs of armor stands: placed into the block
# next to the clicked face; an armor stand item would need the room of a big armor stand, 2 blocks; small armor stands with a colored head; a creative hit removes one,
# admin:build/clear_markers removes all). They stay after a fill: the same markers remove it.
#   point (white, "+") - one block: admin:build/solid/set_pointwise {b:"stone"} / remove_pointwise
#   A (red), B (blue) - the corners of an area: admin:build/solid/fill_markers {b:"stone"} / remove_markers
# There is only one A and one B: a new one removes the old one (admin:build/internal/placed).
# Only in the lobby
execute unless score game state = lobby state run return run function admin:build/internal/wrong_phase

give @s bat_spawn_egg[\
    item_model="minecraft:white_dye",\
    item_name='{"text": "Point marker", "color": "white"}',\
    lore=['{"text": "admin:build/solid/set_pointwise", "color": "gray", "italic": false}'],\
    entity_data={id: "minecraft:armor_stand", Tags: ["build_marker", "build_point"], ArmorItems: [{}, {}, {}, {id: "minecraft:white_concrete", count: 1}], Small: 1b, NoGravity: 1b, Glowing: 1b, CustomNameVisible: 1b, CustomName: '{"text": "+", "color": "white"}'}\
]
give @s bat_spawn_egg[\
    item_model="minecraft:red_dye",\
    item_name='{"text": "Marker A", "color": "red"}',\
    lore=['{"text": "admin:build/solid/fill_markers", "color": "gray", "italic": false}'],\
    entity_data={id: "minecraft:armor_stand", Tags: ["build_marker", "build_a"], ArmorItems: [{}, {}, {}, {id: "minecraft:red_concrete", count: 1}], Small: 1b, NoGravity: 1b, Glowing: 1b, CustomNameVisible: 1b, CustomName: '{"text": "A", "color": "red"}'}\
]
give @s bat_spawn_egg[\
    item_model="minecraft:blue_dye",\
    item_name='{"text": "Marker B", "color": "blue"}',\
    lore=['{"text": "admin:build/solid/fill_markers", "color": "gray", "italic": false}'],\
    entity_data={id: "minecraft:armor_stand", Tags: ["build_marker", "build_b"], ArmorItems: [{}, {}, {}, {id: "minecraft:blue_concrete", count: 1}], Small: 1b, NoGravity: 1b, Glowing: 1b, CustomNameVisible: 1b, CustomName: '{"text": "B", "color": "blue"}'}\
]
