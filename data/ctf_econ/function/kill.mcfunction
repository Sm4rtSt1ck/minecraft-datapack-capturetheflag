# Runs as the killer. Reward depends on the weapon in the main hand.

# Teamkill: the attack team is always red, the defense blue (ctf:match/start, swap_teams)
execute if entity @s[tag=attack, scores={tk.red=1..}] run return run function ctf_econ:teamkill
execute if entity @s[tag=defense, scores={tk.blue=1..}] run return run function ctf_econ:teamkill

# Any kill during an active ultimate (the thrown trident leaves the hand empty)
execute if entity @s[tag=ultimate] run return run function ctf_econ:give {key: "kill.ultimate", reason: "kill (ultimate)"}

execute unless items entity @s weapon.mainhand * run return run function ctf_econ:give {key: "kill.fist", reason: "kill (bare hands)"}
execute if items entity @s weapon.mainhand stick run return run function ctf_econ:give {key: "kill.stick", reason: "kill (flag breaker)"}
execute if items entity @s weapon.mainhand *[custom_data~{tags:["ultimate"]}] run return run function ctf_econ:give {key: "kill.ultimate", reason: "kill (ultimate)"}
execute if items entity @s weapon.mainhand *[custom_data~{wpn:"golden_sword"}] run return run function ctf_econ:give {key: "kill.golden_sword", reason: "kill (golden sword)"}
execute if items entity @s weapon.mainhand *[custom_data~{wpn:"iron_sword"}] run return run function ctf_econ:give {key: "kill.iron_sword", reason: "kill (iron sword)"}
execute if items entity @s weapon.mainhand *[custom_data~{wpn:"diamond_sword"}] run return run function ctf_econ:give {key: "kill.diamond_sword", reason: "kill (diamond sword)"}
execute if items entity @s weapon.mainhand *[custom_data~{wpn:"netherite_sword"}] run return run function ctf_econ:give {key: "kill.netherite_sword", reason: "kill (netherite sword)"}
execute if items entity @s weapon.mainhand *[custom_data~{wpn:"mace"}] run return run function ctf_econ:give {key: "kill.mace", reason: "kill (mace)"}
execute if items entity @s weapon.mainhand *[custom_data~{wpn:"bow"}] run return run function ctf_econ:give {key: "kill.bow", reason: "kill (bow)"}
execute if items entity @s weapon.mainhand *[custom_data~{wpn:"fire_bow"}] run return run function ctf_econ:give {key: "kill.fire_bow", reason: "kill (fire bow)"}
execute if items entity @s weapon.mainhand *[custom_data~{wpn:"punch_bow"}] run return run function ctf_econ:give {key: "kill.punch_bow", reason: "kill (punch bow)"}
execute if items entity @s weapon.mainhand *[custom_data~{wpn:"power_bow"}] run return run function ctf_econ:give {key: "kill.power_bow", reason: "kill (power bow)"}
execute if items entity @s weapon.mainhand *[custom_data~{wpn:"crossbow"}] run return run function ctf_econ:give {key: "kill.crossbow", reason: "kill (crossbow)"}
function ctf_econ:give {key: "kill.other", reason: "kill"}
