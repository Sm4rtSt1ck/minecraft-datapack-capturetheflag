execute at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.2
function ctf_shop:ui/actionbar

# give puts the item into the first empty slot; ctf_inv moves it to its own slot this tick
function ctf_inv:api/refresh
