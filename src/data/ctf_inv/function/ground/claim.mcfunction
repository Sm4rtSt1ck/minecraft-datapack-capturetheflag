# Runs as a player next to items: he becomes the owner of the nearest item of every kind he may take
# (an item has only one kind, so the order of the kinds doesn't matter)
from registry:items import GROUPS, AMMO, LIMITS

def claim(kind):
    execute if entity @s[tag=f"ctf.can.{kind}"] as @e[type=item, tag=f"ctf.r.{kind}", distance=..3, sort=nearest, limit=1] if function ctf_inv:ground/may_take run function ctf_inv:ground/claim_item

tag @s add ctf.claimer
scoreboard players operation #me inv.tmp = @s player_id
claim("flag")
for g in GROUPS:
    claim(g["kind"])
for a in AMMO:
    claim(f"ammo_{a['id']}")
for l in LIMITS:
    if "kind" in l:
        claim(l["kind"])
claim("off")
claim("free")
claim("trap_def")
claim("trap_att")
tag @s remove ctf.claimer
