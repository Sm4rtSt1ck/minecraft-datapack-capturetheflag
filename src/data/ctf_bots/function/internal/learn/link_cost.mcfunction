# As a baked link the bots learned about: + LEARN "fail" a failure, - a quarter of it a success (1 at least)
from registry:bots import LEARN
scoreboard players set #found lrn 1
scoreboard players operation #x lrn = #lf lrn
scoreboard players set #k lrn (LEARN["fail"])
scoreboard players operation #x lrn *= #k lrn
scoreboard players operation #y lrn = #ls lrn
scoreboard players set #k lrn (LEARN["fail"] // 4)
scoreboard players operation #y lrn *= #k lrn
scoreboard players operation #x lrn -= #y lrn
scoreboard players operation @s nav.c += #x lrn
execute if score @s nav.c matches ..0 run scoreboard players set @s nav.c 1
