# The only way wind charges are given (mace, shop), so they all stack. count
$execute unless items entity @s weapon.offhand * run return run item replace entity @s weapon.offhand with wind_charge[custom_name='{"text": "Wind charge", "italic": false}', custom_data={tags:[""], ctf_item:"wind"}] $(count)
$give @s wind_charge[custom_name='{"text": "Wind charge", "italic": false}', custom_data={tags:[""], ctf_item:"wind"}] $(count)
