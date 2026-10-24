# Something was moved out of slots 9-35: find out what
scoreboard players set #miss shop.tmp 0
function ctf_shop:internal/scan

# Exactly one slot changed -> it is a click.
# Several slots at once (fast clicks, rejoin, ...) -> just redraw, no purchase.
execute if score #miss shop.tmp matches 1 run function ctf_shop:internal/click

function ctf_shop:internal/render
