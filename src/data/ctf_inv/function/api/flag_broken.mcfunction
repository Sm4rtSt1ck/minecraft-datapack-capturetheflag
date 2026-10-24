# 1 if the flag has been broken in this round (the flag breaker is no longer needed)
execute if score broken flag_state matches 1 run return 1
# Backup check: during the round the placed flag is an armor stand tagged "flag"
execute if score game state = round state unless entity @e[type=armor_stand, tag=flag, limit=1] run return 1
return 0
