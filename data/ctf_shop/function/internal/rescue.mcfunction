# If the player's own item was swapped into the UI slot (cursor, number keys, F),
# move it back where the UI item went. The item is MOVED (the UI slot is emptied),
# otherwise the redraw would put a second copy into the hotbar.
$execute unless items entity @s container.$(slot) * run return 0
$execute if items entity @s container.$(slot) *[custom_data~{ctf_ui:{}}] run return 0
$execute if items entity @s weapon.offhand *[custom_data~{ctf_ui:{slot:$(slot)}}] run return run function ctf_shop:internal/move {from: "container.$(slot)", to: "weapon.offhand"}
$execute if items entity @s hotbar.0 *[custom_data~{ctf_ui:{slot:$(slot)}}] run return run function ctf_shop:internal/move {from: "container.$(slot)", to: "hotbar.0"}
$execute if items entity @s hotbar.1 *[custom_data~{ctf_ui:{slot:$(slot)}}] run return run function ctf_shop:internal/move {from: "container.$(slot)", to: "hotbar.1"}
$execute if items entity @s hotbar.2 *[custom_data~{ctf_ui:{slot:$(slot)}}] run return run function ctf_shop:internal/move {from: "container.$(slot)", to: "hotbar.2"}
$execute if items entity @s hotbar.3 *[custom_data~{ctf_ui:{slot:$(slot)}}] run return run function ctf_shop:internal/move {from: "container.$(slot)", to: "hotbar.3"}
$execute if items entity @s hotbar.4 *[custom_data~{ctf_ui:{slot:$(slot)}}] run return run function ctf_shop:internal/move {from: "container.$(slot)", to: "hotbar.4"}
$execute if items entity @s hotbar.5 *[custom_data~{ctf_ui:{slot:$(slot)}}] run return run function ctf_shop:internal/move {from: "container.$(slot)", to: "hotbar.5"}
$execute if items entity @s hotbar.6 *[custom_data~{ctf_ui:{slot:$(slot)}}] run return run function ctf_shop:internal/move {from: "container.$(slot)", to: "hotbar.6"}
$execute if items entity @s hotbar.7 *[custom_data~{ctf_ui:{slot:$(slot)}}] run return run function ctf_shop:internal/move {from: "container.$(slot)", to: "hotbar.7"}
$execute if items entity @s hotbar.8 *[custom_data~{ctf_ui:{slot:$(slot)}}] run return run function ctf_shop:internal/move {from: "container.$(slot)", to: "hotbar.8"}

# Swapped through the cursor: the player keeps holding their item
$execute if items entity @s player.cursor *[custom_data~{ctf_ui:{}}] run return run function ctf_shop:internal/move {from: "container.$(slot)", to: "player.cursor"}
$execute unless items entity @s player.cursor * run return run function ctf_shop:internal/move {from: "container.$(slot)", to: "player.cursor"}
