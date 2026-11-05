# As a route marker (admin:build/bots/internal/route_step): appended to its route
function admin:build/bots/internal/pos
for r in range(1, 5):
    execute if entity @s[tag=f"build_route_{r}"] run data modify storage admin:build f"dump.routes[{r - 1}]" append from storage admin:build pos
