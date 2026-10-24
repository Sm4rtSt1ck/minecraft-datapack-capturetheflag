# #ctf:on/match_start
# Stop map music loops
schedule clear ctf:match/maps/test_map/music
schedule clear ctf:match/maps/green_mine/music
schedule clear ctf:match/maps/night_club/music
schedule clear ctf:match/maps/farm/music
schedule clear ctf:match/maps/railway_station/music

function ctf:match/maps/call_current {function: "start"}
