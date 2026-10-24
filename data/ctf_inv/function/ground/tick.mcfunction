# XP orbs (dropped on death) would change the ultimate bar of the player who picks them up
kill @e[type=experience_orb]

# Shot arrows can't be picked up (ammo is restored every round instead)
execute as @e[type=arrow, tag=!ctf.arrow] run function ctf_inv:ground/arrow

# New item entities are classified once (tags ctf.r.<kind>), UI items are killed
execute as @e[type=item, tag=!ctf.seen] run function ctf_inv:ground/classify

# Flag (broken banner)
execute if score game state matches 4..5 as @e[type=item, tag=ctf.r.banner] at @s run \
    data modify entity @s Owner set from entity @n[tag=!defense, tag=!ultimate] UUID
execute if score game state matches 4..5 as @e[type=item, tag=ctf.r.banner] at @s run \
    data modify entity @s Owner set from entity @n[tag=attack, tag=!ultimate] UUID

# Everything else: only a player who has a place for the item can pick it up.
# Items next to players: nobody may pick them up... (tag ctf.own0: Owner is already [I;0,0,0,1], so the
# entity NBT is written only when it changes; ctf_inv:ground/claim_item removes the tag)
execute as @e[type=item, tag=ctf.seen, tag=!ctf.own0, tag=!ctf.r.banner, tag=!ctf.r.wear, tag=!ctf.buf] at @s if entity @a[tag=player, gamemode=!spectator, distance=..3] run function ctf_inv:ground/lock
# ...except the player who claims it: every player claims the NEAREST item of every kind he may
# take (one per kind per tick, so two swords lying together are never picked up at once)
execute as @a[tag=player, gamemode=!spectator] at @s if entity @e[type=item, tag=ctf.seen, tag=!ctf.r.banner, tag=!ctf.r.wear, tag=!ctf.buf, distance=..3] run function ctf_inv:ground/claim

# Armor (nobody picks it up, see ctf_inv:ground/armor) is put on straight from the ground
execute as @a[tag=player, gamemode=!spectator] at @s if entity @e[type=item, tag=ctf.r.wear, distance=..1.5] run function ctf_inv:ground/wear
