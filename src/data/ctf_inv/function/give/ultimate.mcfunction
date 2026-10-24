# The ultimate item of the chosen ultimate (registry ULTIMATES: number = ultimate_category)
from registry:ultimates import ULTIMATES

clear @s carrot_on_a_stick[custom_data~{action:"ultimate"}]
for i in range(len(ULTIMATES)):
    u = ULTIMATES[i]
    execute if score @s ultimate_category matches (i) run item replace entity @s hotbar.8 with carrot_on_a_stick[item_model=(f"minecraft:{u['model']}"), custom_name=(f'[{{"text":"ULTIMATE ({u["name"]}) [", "color": "#f94bff", "bold": true, "italic": false, "shadow_color": -8379784}}, {{"keybind":"key.use"}}, {{"text": "]"}}]'), custom_data={action:"ultimate", bind:1b}]
