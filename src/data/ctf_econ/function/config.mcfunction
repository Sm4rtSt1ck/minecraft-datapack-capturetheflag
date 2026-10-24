# ECONOMY SETTINGS. All money values of the game are set here (run at match start);
# the kill rewards: registry/econ.bolt.
from registry:econ import WEAPON_KILLS, KILLS
# Similar to CS: wins pay a lot, losses pay a growing loss bonus,
# cheap / hard weapons pay more per kill than strong ones.

# Money at the start of each half (pistol round) and the maximum
scoreboard players set #start econ 150
scoreboard players set #max econ 1600

# Round win (every player of the winning team)
#   win.flag    - attackers delivered the flag
#   win.noflag  - defenders did not place the flag
#   win.elim    - all attackers are dead
#   win.timeout - the time is over
scoreboard players set #win.flag econ 350
scoreboard players set #win.noflag econ 325
scoreboard players set #win.elim econ 325
scoreboard players set #win.timeout econ 325

# Loss bonus (every player of the losing team): base + step * (losses in a row - 1)
# 1 loss: 140, 2: 190, 3: 240, 4: 290, 5+: 340. A win lowers the counter by 1.
scoreboard players set #loss.base econ 140
scoreboard players set #loss.step econ 50
scoreboard players set #loss.max_streak econ 5

# Objectives
#   break       - the player who broke the flag
#   bring       - the player who delivered the flag
#   broken_loss - every attacker, if the attack lost the round after breaking the flag
scoreboard players set #break econ 30
scoreboard players set #bring econ 30
scoreboard players set #broken_loss econ 80

# Teamkill penalty
scoreboard players set #teamkill econ 30

# Kill rewards (registry/econ.bolt)
for w in WEAPON_KILLS:
    scoreboard players set f"#kill.{w['wpn']}" econ w["money"]
for k in KILLS:
    scoreboard players set f"#kill.{k['id']}" econ k["money"]
