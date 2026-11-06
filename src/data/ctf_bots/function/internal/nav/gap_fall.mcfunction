# A walk test jumping down over a gap (#mode 2): a floor below within NAV "max_fall" ends the gap there;
# none: on over the gap
execute if function ctf_bots:internal/nav/fall_probe run return run function ctf_bots:internal/nav/fall_start
function ctf_bots:internal/nav/walk
