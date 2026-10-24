# Runs in the layout check (ctf_inv:layout/check), after the hotbar layout.
# The bow is taken for the first time: its 3 arrows (they are never refilled)
execute if items entity @s hotbar.1 bow[custom_data~{wpn: "creep", creep_new: 1b}] run function ctf_loot:reward/creep/first
