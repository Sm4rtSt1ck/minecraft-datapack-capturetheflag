# A walk test, no floor right below: down to the first floor within NAV "max_fall" blocks (a fall:
# ctf_bots:internal/nav/fall_down); #mode 1: on from there, #mode 2 (over a gap): the gap crossed
scoreboard players set #fh nav 0
function ctf_bots:internal/nav/fall_down
