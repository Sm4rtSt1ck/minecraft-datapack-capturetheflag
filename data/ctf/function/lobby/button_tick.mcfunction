# PARENT: lobby/tick

$clear @a[tag=lobby, nbt=!{Inventory:[{id: "minecraft:carrot_on_a_stick", Slot:$(slot)b}]}] carrot_on_a_stick[item_model="$(item_model)"]

# Give items
$item replace entity @a[tag=lobby] hotbar.$(slot) with carrot_on_a_stick[\
    item_model="$(item_model)",\
    custom_data={tags: ["menu"]},\
    custom_name="{\
        \"shadow_color\": -16252673,\
        \"text\" :\"$(name)\"\
    }"\
]

# Check first map choice (left hand)
$execute as @a[tag=lobby, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[item_model="$(item_model)"] run $(command)
