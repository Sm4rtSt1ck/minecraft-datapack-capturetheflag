# The duration: registry ULTIMATES
from registry:ultimates import ult
scoreboard players set @s timer ult("scale")["duration"]


attribute @s minecraft:scale base set 0.45

effect give @s minecraft:jump_boost infinite 3 true
effect give @s minecraft:speed infinite 1 true
