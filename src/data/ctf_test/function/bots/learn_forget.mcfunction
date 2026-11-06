# Forget everything the bots learned (all maps, the purchases)
function ctf_bots:api/learn/forget
tellraw @s {"text": "The bots forgot everything they learned", "color": "yellow"}
