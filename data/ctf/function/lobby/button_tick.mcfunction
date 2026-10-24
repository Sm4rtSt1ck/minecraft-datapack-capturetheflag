# PARENT: lobby/tick

$execute as @a[tag=lobby] unless items entity @s hotbar.$(slot) carrot_on_a_stick run clear @s carrot_on_a_stick[item_model="$(item_model)"]

# Give items
$item replace entity @a[tag=lobby] hotbar.$(slot) with carrot_on_a_stick[\
    item_model="$(item_model)",\
    custom_data={tags: ["menu"]},\
    custom_name='$(name)',\
    enchantments={levels:{unbreaking:1}, show_in_tooltip:false}\
]

# Check first map choice (left hand)
$execute as @a[tag=lobby, scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[item_model="$(item_model)"] run $(command)
