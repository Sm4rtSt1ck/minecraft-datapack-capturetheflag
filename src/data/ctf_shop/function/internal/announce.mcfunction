# A click on the product $(id): bought (#ok shop.tmp 1)? Then #ctf:on/bought (as the buyer, storage
# ctf:bought id: the product id; the bots learn what players buy). Returns the purchase result
execute unless score #ok shop.tmp matches 1.. run return 0
$data modify storage ctf:bought id set value "$(id)"
function #ctf:on/bought
return 1
