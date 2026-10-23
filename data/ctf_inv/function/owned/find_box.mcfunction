# Runs as a box marker: is it the box of #o?
execute store result score #mo inv.tmp run data get entity @s data.owner
execute unless score #mo inv.tmp = #o inv.tmp run return 0
function ctf_inv:owned/put_back with entity @s data
