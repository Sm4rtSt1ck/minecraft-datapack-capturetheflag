# ECONOMY SETTINGS. All money values of the game are set here (run at match start).
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

# Kill reward by the weapon in the killer's main hand
scoreboard players set #kill.fist econ 150
scoreboard players set #kill.stick econ 150
scoreboard players set #kill.golden_sword econ 40
scoreboard players set #kill.iron_sword econ 50
scoreboard players set #kill.diamond_sword econ 35
scoreboard players set #kill.netherite_sword econ 30
scoreboard players set #kill.mace econ 40
scoreboard players set #kill.bow econ 45
scoreboard players set #kill.fire_bow econ 40
scoreboard players set #kill.punch_bow econ 40
scoreboard players set #kill.rifle econ 25
scoreboard players set #kill.crossbow econ 20
scoreboard players set #kill.sniper econ 15
scoreboard players set #kill.inferno econ 30
scoreboard players set #kill.ultimate econ 20
# Kills credited by ctf:match/events/credit (the game credits nobody for them)
scoreboard players set #kill.grenade econ 30
scoreboard players set #kill.trap econ 30
scoreboard players set #kill.other econ 30
