# As a link a bot failed: dearer (NAV "penalty"), the fields computed again (ctf_bots:internal/nav/invalidate)
from registry:bots import NAV
scoreboard players add @s nav.c (NAV["penalty"])
tag @s add nav_pen
scoreboard players set #pen nav 1
function ctf_bots:internal/nav/invalidate
