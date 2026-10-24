# LOOT CRATES SETTINGS (run at match start): the storage ctf_loot:config is filled from the
# registry registry/loot.bolt (rarities, tasks, task settings). Full description: MECHANICS.md
from registry:loot import RARITIES, TASKS, KILLS, UNKILLABLE, KILLS_TOTAL, rank
from nbtlib import Float

# The colors are float lists (as RGB of the particles)
def _floats(values):
    out = []
    for v in values:
        out.append(Float(v))
    return out

_rarities = {}
for i in range(len(RARITIES)):
    r = RARITIES[i]
    _rarities[r["id"]] = {"rank": i + 1, "name": r["name"], "box": r["box"], "from_color": _floats(r["from_color"]), "color": _floats(r["color"]), "text_color": r["text_color"], "reward": r["reward"]}
data modify storage ctf_loot:config rarities set value (_rarities)

_tasks = {}
for t in TASKS:
    _task = {"rank": rank(t["rarity"]), "text": t["text"]}
    if "reward" in t:
        _task["reward"] = t["reward"]
    _tasks[t["id"]] = _task
data modify storage ctf_loot:config tasks set value (_tasks)

data modify storage ctf_loot:config kills set value (KILLS)
data modify storage ctf_loot:config unkillable set value (UNKILLABLE)
data modify storage ctf_loot:config kills_total set value (KILLS_TOTAL)
