# Runs as a trap marker that is set off by a shot or damage (bullets: ctf_guns:ray/hit_trap, the rest: traps/hurt)
execute if entity @s[tag=trap.tnt] run return run function ctf_traps:internal/tnt/trigger
execute if entity @s[tag=trap.anvil] run return run function ctf_traps:internal/anvil/trigger
execute if entity @s[tag=trap.web] run return run function ctf_traps:internal/web/trigger
execute if entity @s[tag=trap.levitation] run return run function ctf_traps:internal/levitation/trigger
execute if entity @s[tag=trap.wither] run return run function ctf_traps:internal/wither/trigger
