# #s / #l / #f: the chestplate / leggings / boots belong to the set the player assembled. sid
$execute store success score #s inv.tmp if items entity @s armor.chest *[custom_data~{ctf_set:{sid:$(sid)}}]
$execute store success score #l inv.tmp if items entity @s armor.legs *[custom_data~{ctf_part:1b, sid:$(sid)}]
$execute store success score #f inv.tmp if items entity @s armor.feet *[custom_data~{ctf_part:1b, sid:$(sid)}]
