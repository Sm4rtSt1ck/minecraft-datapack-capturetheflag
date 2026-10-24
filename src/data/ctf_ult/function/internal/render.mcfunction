# XP bar = ultimate charge, or the time left of the active ultimate.
# The level number shows the percent. The bar is always computed from the scores
# (never changed step by step), so it can't drift away from them.
scoreboard players set #v ult.tmp 0
scoreboard players set #max ult.tmp 1
execute if entity @s[tag=ultimate] if score @s timer matches 0.. run scoreboard players operation #v ult.tmp = @s timer
execute if entity @s[tag=ultimate] if score @s ult.dur matches 1.. run scoreboard players operation #max ult.tmp = @s ult.dur
execute unless entity @s[tag=ultimate] if score @s ultimate matches 0.. run scoreboard players operation #v ult.tmp = @s ultimate
execute unless entity @s[tag=ultimate] if score max ultimate matches 1.. run scoreboard players operation #max ult.tmp = max ultimate
execute if score #v ult.tmp > #max ult.tmp run scoreboard players operation #v ult.tmp = #max ult.tmp

# percent = v * 100 / max; points = v * 201 / max (level 40 needs 202 points for the next level)
scoreboard players operation #pct ult.tmp = #v ult.tmp
scoreboard players set #k ult.tmp 100
scoreboard players operation #pct ult.tmp *= #k ult.tmp
scoreboard players operation #pct ult.tmp /= #max ult.tmp
scoreboard players operation #pts ult.tmp = #v ult.tmp
scoreboard players set #k ult.tmp 201
scoreboard players operation #pts ult.tmp *= #k ult.tmp
scoreboard players operation #pts ult.tmp /= #max ult.tmp

execute store result storage ctf:ultimate bar.pct int 1 run scoreboard players get #pct ult.tmp
execute store result storage ctf:ultimate bar.pts int 1 run scoreboard players get #pts ult.tmp
function ctf_ult:internal/render_apply with storage ctf:ultimate bar
