# New bot markers (placed, shown): the glow of every kind is written again at the next tick
from admin:bot_markers import kinds
for _k in kinds():
    scoreboard players set f"#glow_{_k['id']}" solid.tmp -1
