# Runs as a trap marker that is set off by a shot or damage (bullets: ctf_guns:ray/hit_trap, the rest: traps/hurt)
from registry:traps import TRAPS

for t in TRAPS:
    if t["fires"]:
        execute if entity @s[tag=f"trap.{t['id']}"] run return run function f"ctf_traps:internal/{t['id']}/trigger"
