# Freeze start: the round limits count the items the player already carries (registry ROUND_LIMITS)
from registry:shop import ROUND_LIMITS
from registry:items import limit
from ctf_inv:lib import count

function ctf_inv:limits/enforce
for r in ROUND_LIMITS:
    count(limit(r["id"])["pred"])
    scoreboard players operation @s f"shop.lim.{r['id']}" = #n inv.tmp
