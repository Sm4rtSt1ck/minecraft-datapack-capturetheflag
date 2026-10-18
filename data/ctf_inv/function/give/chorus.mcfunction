# The only way chorus fruits are given (shop, refund, normalization), so they all stack.
# Freeze: an inedible copy (no "consumable" component), round: a normal one. count
$execute if score game state = freeze state run return run function ctf_inv:give/chorus_locked {count: $(count)}
$return run give @s chorus_fruit[custom_name='{"text": "Chorus fruit", "italic": false}', custom_data={tags:[""], ctf_item:"chorus"}] $(count)
