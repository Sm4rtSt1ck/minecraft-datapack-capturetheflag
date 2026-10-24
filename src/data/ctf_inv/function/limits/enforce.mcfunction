# Carry limits: registry LIMITS (ctf_inv:limits/max/<id>). Purchase limits: ctf_shop:limits/reset
from registry:items import LIMITS

for l in LIMITS:
    function f"ctf_inv:limits/max/{l['id']}"
