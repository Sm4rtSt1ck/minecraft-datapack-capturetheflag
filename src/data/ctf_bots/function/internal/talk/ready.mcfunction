# As a bot about to tell news about the player tagged bk_who (his intel marker tagged bk_about):
# can it talk now? (ctf_bots:internal/talk/free). Then the coordinates of the intel (bk.x / bk.y /
# bk.z), the weapon name (storage ctf_bots:talk wpn), the news said now
execute unless function ctf_bots:internal/talk/free run return 0
function ctf_bots:internal/talk/about
return 1
