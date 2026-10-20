# The crate lands: shulker box + sign with the owner's name, the click catcher, explosion, shake
function ctf_loot:fall/place with entity @s data.r
function ctf_loot:fall/place_at with entity @s data
function ctf_loot:fall/sign_name with entity @s data
function ctf_loot:fall/spawn with entity @s data
execute positioned ~ ~0.5 ~ run function ctf_fx:explosion
execute as @a[tag=attack, distance=..25] run function ctf_fx:shake
kill @s
