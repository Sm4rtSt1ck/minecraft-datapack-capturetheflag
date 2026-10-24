# #ctf:on/freeze_start
# Remove the placed flag if it hadn't been broken
execute positioned as @e[type=armor_stand, tag=flag] run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 air replace magenta_banner
kill @e[tag=flag]

# Flag breaker: given to attackers in slot 8 by ctf_inv (ctf_inv:layout/ensure)
scoreboard players set broken flag_state 0
