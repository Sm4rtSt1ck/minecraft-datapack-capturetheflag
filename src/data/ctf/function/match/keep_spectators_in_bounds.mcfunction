# Spectators stay in the arena: pushed back from the volume beyond every side (registry/world.bolt)
from registry:world import ARENA
_lo = ARENA["spectator_min"]
_hi = ARENA["spectator_max"]
_o = ARENA["outside_corner"]
_n = ARENA["outside_size"]
_d = ARENA["outside_depth"]
execute as @a[tag=!lobby, gamemode=spectator] if entity @s[x=(_lo[0]), y=(_o[1]), z=(_o[2]), dx=(-_d), dy=(_n), dz=(_n)] at @s run tp @s ~1 ~ ~
execute as @a[tag=!lobby, gamemode=spectator] if entity @s[x=(_o[0]), y=(_o[1]), z=(_hi[2]), dx=(_n), dy=(_n), dz=(_d)] at @s run tp @s ~ ~ ~-1
execute as @a[tag=!lobby, gamemode=spectator] if entity @s[x=(_hi[0]), y=(_o[1]), z=(_o[2]), dx=(_d), dy=(_n), dz=(_n)] at @s run tp @s ~-1 ~ ~
execute as @a[tag=!lobby, gamemode=spectator] if entity @s[x=(_o[0]), y=(_o[1]), z=(_lo[2]), dx=(_n), dy=(_n), dz=(-_d)] at @s run tp @s ~ ~ ~1
execute as @a[tag=!lobby, gamemode=spectator] if entity @s[x=(_o[0]), y=(_lo[1]), z=(_o[2]), dx=(_n), dy=(-_d), dz=(_n)] at @s run tp @s ~ ~1 ~
execute as @a[tag=!lobby, gamemode=spectator] if entity @s[x=(_o[0]), y=(_hi[1]), z=(_o[2]), dx=(_n), dy=(_d), dz=(_n)] at @s run tp @s ~ ~-1 ~
