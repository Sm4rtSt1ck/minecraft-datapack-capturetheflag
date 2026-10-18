# #n inv.tmp = how many items matching pred the player carries (inventory + offhand + cursor + 2x2 crafting grid)
$execute store result score #n inv.tmp if items entity @s container.* $(pred)
$execute store result score #o inv.tmp if items entity @s weapon.offhand $(pred)
scoreboard players operation #n inv.tmp += #o inv.tmp
$execute store result score #o inv.tmp if items entity @s player.cursor $(pred)
scoreboard players operation #n inv.tmp += #o inv.tmp
$execute store result score #o inv.tmp if items entity @s player.crafting.* $(pred)
scoreboard players operation #n inv.tmp += #o inv.tmp
