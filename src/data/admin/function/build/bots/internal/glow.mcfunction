# admin:tick (lobby): only the bot markers of the kind held in a player's main hand (its egg) glow.
# Written only on change: #glow_<kind> solid.tmp = the state written (-1: unknown, rewrite)
from admin:bot_markers import kinds
for _k in kinds():
    scoreboard players set f"#held_{_k['id']}" solid.tmp 0
    execute as @a if items entity @s weapon.mainhand f'bat_spawn_egg[item_model="minecraft:{_k["color"]}_dye"]' run scoreboard players set f"#held_{_k['id']}" solid.tmp 1
    execute unless score f"#held_{_k['id']}" solid.tmp = f"#glow_{_k['id']}" solid.tmp run function admin:build/bots/internal/glow_set {tag: (_k["tag"]), id: (_k["id"])}
