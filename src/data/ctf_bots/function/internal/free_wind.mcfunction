# As a bot at freeze: FREE_WIND wind charges more (bot.wind), up to the carry limit of registry/items.bolt
from registry:bots import FREE_WIND
from registry:items import LIMITS
_max = 10
for _l in LIMITS:
    if _l["id"] == "wind":
        _max = _l["max"]
scoreboard players add @s bot.wind (FREE_WIND)
execute if score @s bot.wind matches (f"{_max + 1}..") run scoreboard players set @s bot.wind (_max)
