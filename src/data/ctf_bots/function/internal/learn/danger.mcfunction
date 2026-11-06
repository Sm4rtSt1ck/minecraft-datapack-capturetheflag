# As a node: #dgf nav = its learned danger as an extra cost (deaths near it, lrn.dg x LEARN "danger" / 10,
# LEARN "danger_max" at most; learning off: 0)
from registry:bots import LEARN
scoreboard players set #dgf nav 0
execute unless score Bots_learn settings matches 1 run return 0
scoreboard players operation #dgf nav = @s lrn.dg
scoreboard players set #k nav (LEARN["danger"])
scoreboard players operation #dgf nav *= #k nav
scoreboard players set #k nav 10
scoreboard players operation #dgf nav /= #k nav
execute if score #dgf nav matches (f"{LEARN['danger_max']}..") run scoreboard players set #dgf nav (LEARN["danger_max"])
