# As a bot in a fire block / lava: it burns at least BODY_FX "in_fire" ticks and takes 1 damage every
# "in_fire_every" ticks, like a player in fire (generic damage: the fire damage types don't hurt a
# fire-immune mob; the burn kills: ctf_fight:internal/credit, the fire area of the Inferno blade)
from registry:bots import BODY_FX
execute unless score @s bot.fire matches (BODY_FX["in_fire"]).. run scoreboard players set @s bot.fire (BODY_FX["in_fire"])
scoreboard players operation #m bots = @s bot.fire
scoreboard players set #k bots (BODY_FX["in_fire_every"])
scoreboard players operation #m bots %= #k bots
execute if score #m bots matches 0 run damage @s 1 minecraft:generic
