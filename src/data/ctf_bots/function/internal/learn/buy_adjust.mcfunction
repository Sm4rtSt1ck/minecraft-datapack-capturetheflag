# An item the bots bought #bn lrn times in this context, giving #bv lrn (kills x 10 + won x 10 + alive x 5):
# on average below LEARN "buy_low": its count #c lrn halved; above LEARN "buy_high": x 1.5
from registry:bots import LEARN
scoreboard players operation #bv lrn /= #bn lrn
execute if score #bv lrn matches (f"..{LEARN['buy_low'] - 1}") run scoreboard players operation #c lrn /= #2 lrn
execute if score #bv lrn matches (f"{LEARN['buy_high'] + 1}..") run scoreboard players operation #c lrn *= #3 lrn
execute if score #bv lrn matches (f"{LEARN['buy_high'] + 1}..") run scoreboard players operation #c lrn /= #2 lrn
