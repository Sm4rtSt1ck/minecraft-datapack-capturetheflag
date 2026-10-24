# Armor matching pred in the inventory (not on the cursor: the player may carry it to drop it)
# is put on into the slot "to" if it is empty, otherwise dropped. pred, to
$execute store result score #a inv.tmp if items entity @s container.* $(pred)
$execute store result score #o inv.tmp if items entity @s weapon.offhand $(pred)
scoreboard players operation #a inv.tmp += #o inv.tmp
$execute store result score #o inv.tmp if items entity @s player.crafting.* $(pred)
scoreboard players operation #a inv.tmp += #o inv.tmp
execute if score #a inv.tmp matches 0 run return 0
$function ctf_inv:armor/loose_scan {pred: '$(pred)', to: "$(to)"}
