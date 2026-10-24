# Runs as a player who votes to skip the warm-up (once): his button glints, everyone sees the votes
tag @s add skip
item modify entity @s weapon.mainhand {function: "minecraft:set_components", components: {"minecraft:enchantment_glint_override": true}}
# The new votes (and the skip, if there are enough of them)
function ctf:match/warmup/count_votes
tellraw @a[tag=player] [{"selector": "@s"}, {"text": " voted to skip the warm-up (", "color": "yellow"}, {"score": {"name": "#votes", "objective": "skip.tmp"}, "color": "yellow"}, {"text": "/", "color": "yellow"}, {"score": {"name": "#need", "objective": "skip.tmp"}, "color": "yellow"}, {"text": ")", "color": "yellow"}]
