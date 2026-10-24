# Fills the ammo of every weapon the player has (purchase, start of freeze). Max per weapon:
# registry AMMO (ctf_inv:ammo/fill/<id>)
from registry:items import AMMO

for a in AMMO:
    if a["fill"]:
        function f"ctf_inv:ammo/fill/{a['id']}"
function ctf_inv:ammo/fill_wind
function ctf_guns:rifle/fill_mag
function ctf_inv:api/refresh
