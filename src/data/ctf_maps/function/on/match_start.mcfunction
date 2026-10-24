# #ctf:on/match_start
# Stop map music loops (registry MAPS)
from registry:maps import MAPS
for m in MAPS:
    schedule clear f"ctf_maps:map/{m['id']}/music"

function ctf_maps:api/call/start
