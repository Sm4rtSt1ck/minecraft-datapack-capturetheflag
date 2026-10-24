# #ctf:on/match_start
# Stop map music loops
schedule clear ctf_maps:map/test_map/music
schedule clear ctf_maps:map/green_mine/music
schedule clear ctf_maps:map/night_club/music
schedule clear ctf_maps:map/farm/music
schedule clear ctf_maps:map/railway_station/music

function ctf_maps:api/call_current {function: "start"}
