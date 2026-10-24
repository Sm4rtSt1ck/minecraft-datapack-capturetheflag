# Which ammo the player may pick up: only for his weapon and below max (registry AMMO,
# ctf_inv:ammo/cap/<id>)
from registry:items import AMMO

for a in AMMO:
    function f"ctf_inv:ammo/cap/{a['id']}"
