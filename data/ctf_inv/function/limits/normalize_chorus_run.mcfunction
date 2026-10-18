# id - ctf_item of the right chorus for the current phase
$function ctf_inv:limits/count {pred: 'chorus_fruit[!custom_data~{ctf_item:"$(id)"}]'}
execute if score #n inv.tmp matches ..0 run return 0

# The new ones are given first; the old ones are removed only if that worked,
# so a chorus fruit can never just disappear
execute store result storage ctf_inv:tmp chorus.count int 1 run scoreboard players get #n inv.tmp
scoreboard players set #ok inv.tmp 0
execute store result score #ok inv.tmp run function ctf_inv:give/chorus with storage ctf_inv:tmp chorus
$execute if score #ok inv.tmp matches 1.. run clear @s chorus_fruit[!custom_data~{ctf_item:"$(id)"}]
