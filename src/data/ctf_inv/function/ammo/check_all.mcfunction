# Runs in the layout check. Nothing to do without ammo
from registry:items import AMMO

execute unless items entity @s container.* *[custom_data~{ctf_ammo:1b}] unless items entity @s weapon.offhand *[custom_data~{ctf_ammo:1b}] unless items entity @s player.cursor *[custom_data~{ctf_ammo:1b}] run return 0
# Every ammo type of the registry AMMO (ctf_inv:ammo/check/<id>)
for a in AMMO:
    function f"ctf_inv:ammo/check/{a['id']}"
