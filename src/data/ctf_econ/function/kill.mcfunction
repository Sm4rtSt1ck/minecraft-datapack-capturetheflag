# Runs as the killer. Reward depends on the weapon in the main hand (registry/econ.bolt).
from registry:econ import WEAPON_KILLS

# Teamkill: the attack team is always red, the defense blue (ctf:match/start, swap_teams)
execute if entity @s[tag=attack, scores={tk.red=1..}] run return run function ctf_econ:teamkill
execute if entity @s[tag=defense, scores={tk.blue=1..}] run return run function ctf_econ:teamkill

# Any kill during an active ultimate (the thrown trident leaves the hand empty)
execute if entity @s[tag=ultimate] run return run function ctf_econ:give {key: "kill.ultimate", reason: "kill (ultimate)"}

execute unless items entity @s weapon.mainhand * run return run function ctf_econ:give {key: "kill.fist", reason: "kill (bare hands)"}
execute if items entity @s weapon.mainhand stick run return run function ctf_econ:give {key: "kill.stick", reason: "kill (flag breaker)"}
execute if items entity @s weapon.mainhand *[custom_data~{tags:["ultimate"]}] run return run function ctf_econ:give {key: "kill.ultimate", reason: "kill (ultimate)"}
for w in WEAPON_KILLS:
    execute if items entity @s weapon.mainhand (f'*[custom_data~{{wpn:"{w["wpn"]}"}}]') run return run function ctf_econ:give {key: (f"kill.{w['wpn']}"), reason: (f"kill ({w['name']})")}
function ctf_econ:give {key: "kill.other", reason: "kill"}
