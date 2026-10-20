# Explosion at every armor stand tagged "test_explosion" + camera shake for the player who runs it
execute at @e[type=armor_stand, tag=test_explosion] positioned ~ ~1 ~ run function ctf_fx:explosion
function ctf_fx:shake
