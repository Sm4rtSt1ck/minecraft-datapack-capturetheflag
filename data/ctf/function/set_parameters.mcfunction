#########################################
# GAMERULES AND WORLD PARAMETERS

# Mobs and world
gamerule doMobSpawning false
gamerule mobGriefing true
gamerule doMobLoot false
gamerule doVinesSpread false
gamerule doFireTick false
gamerule doDaylightCycle false
gamerule doWeatherCycle false
gamerule doTileDrops false
# Players
gamerule spawnRadius 0
gamerule fallDamage false
gamerule keepInventory false
gamerule naturalRegeneration false
gamerule doImmediateRespawn true
gamerule announceAdvancements false
gamerule spectatorsGenerateChunks false
# Commands and something else
gamerule commandBlockOutput false
gamerule sendCommandFeedback false
gamerule reducedDebugInfo true
gamerule commandModificationBlockLimit 2097152
# Other settings
difficulty normal
defaultgamemode adventure
setworldspawn 0 -41 0
time set noon
weather clear

#########################################
# TEAMS

team leave @a

team add lobby
team modify lobby color gold
team modify lobby collisionRule never
team modify lobby friendlyFire false
team modify lobby nametagVisibility hideForOtherTeams
team modify lobby deathMessageVisibility hideForOtherTeams
team modify lobby prefix "⚑ "
team modify lobby suffix " ⚑"

team add team_1
team modify team_1 friendlyFire true
team modify team_1 nametagVisibility hideForOtherTeams
team modify team_1 seeFriendlyInvisibles true

team add team_2
team modify team_2 friendlyFire true
team modify team_2 nametagVisibility hideForOtherTeams
team modify team_2 seeFriendlyInvisibles true

#########################################
# SCOREBOARDS

# Settings
scoreboard objectives add settings dummy {"text": "⚙ SETTINGS ⚙", "color": "aqua", "bold": true}

# Numbers
scoreboard objectives add number dummy
scoreboard players set 1 number 1
scoreboard players set 2 number 2
scoreboard players set 3 number 3

# Global events
scoreboard objectives add had_left minecraft.custom:minecraft.leave_game
scoreboard objectives add carrot_on_stick minecraft.used:minecraft.carrot_on_a_stick

# Game state (0 - lobby, 1 - vote, 2 - warmup, 3 - freeze, 4 - round, 5 - end_round, 6 - swap teams, 7 - end)
scoreboard objectives add state dummy
scoreboard players set lobby state 0
scoreboard players set vote state 1
scoreboard players set warmup state 2
scoreboard players set freeze state 3
scoreboard players set round state 4
scoreboard players set end_round state 5
scoreboard players set swap state 6
scoreboard players set end state 7

scoreboard players operation game state = lobby state

# Vote
scoreboard objectives add map_vote dummy
scoreboard objectives add map_vote_player dummy [\
    {"text": "🎴", "color": "light_purple", "bold": false}, \
    {"text": " VOTES FOR MAPS ", "color": "green", "bold": true}, \
    {"text": "🎴", "color": "light_purple", "bold": false}\
]
scoreboard players reset * map_vote_player

# Timer
scoreboard objectives add timer dummy

# Entity cloning
scoreboard objectives add originX dummy
scoreboard objectives add originY dummy
scoreboard objectives add originZ dummy
scoreboard objectives add targetX dummy
scoreboard objectives add targetY dummy
scoreboard objectives add targetZ dummy

scoreboard objectives add posX dummy
scoreboard objectives add posY dummy
scoreboard objectives add posZ dummy

scoreboard objectives add offsetX dummy
scoreboard objectives add offsetY dummy
scoreboard objectives add offsetZ dummy

scoreboard objectives add destX dummy
scoreboard objectives add destY dummy
scoreboard objectives add destZ dummy

# Ultimate
scoreboard objectives add ultimate dummy
scoreboard objectives add ultimate_category dummy

# Health
scoreboard objectives add health health "hp"
scoreboard objectives setdisplay below_name health
scoreboard objectives modify health numberformat styled {"color":"yellow"}

# Unique match identifier to check if a player is in the match
scoreboard objectives add match_id dummy
# To prevent bla bla lba
scoreboard players add match match_id 1
scoreboard objectives add player_id dummy

# Rounds
scoreboard objectives add rounds dummy "Rounds"
scoreboard players set team_1 rounds 0
scoreboard players set team_2 rounds 0

# Money
scoreboard objectives add money dummy "Money"

# Kills and deaths counters
scoreboard objectives add kills playerKillCount [\
    {"text": "🌢", "color": "light_purple", "bold": false}, \
    {"text": " KILLS ", "color": "#AA99FF", "bold": true}, \
    {"text": "🌢", "color": "light_purple", "bold": false}\
]
scoreboard objectives add deaths deathCount {"text": "Deaths", "color": "red"}

# Match events
scoreboard objectives add just_killed playerKillCount
scoreboard objectives add just_died deathCount
scoreboard objectives add just_used_totem minecraft.used:minecraft.totem_of_undying
scoreboard objectives add flag_placed minecraft.used:minecraft.armor_stand
scoreboard objectives add flag_dropped minecraft.dropped:minecraft.magenta_banner
scoreboard objectives add flag_pickedup minecraft.picked_up:minecraft.magenta_banner
scoreboard objectives add flag_broken minecraft.mined:minecraft.magenta_banner
scoreboard objectives add wall_flag_broken minecraft.mined:minecraft.magenta_wall_banner
scoreboard objectives add just_placed_trap minecraft.used:minecraft.frog_spawn_egg
scoreboard objectives add just_threw_grenade minecraft.used:minecraft.lingering_potion
# Smoke grenades (ctf:match/events/grenades/smoke): throws and cloud ticks left
scoreboard objectives add just_threw_smoke minecraft.used:minecraft.splash_potion
scoreboard objectives add smoke.t dummy
scoreboard objectives add just_used_chorus minecraft.used:minecraft.chorus_fruit

# Economy (ctf_econ): settings (#...), loss streaks, temporary values
scoreboard objectives add econ dummy
scoreboard objectives add econ.tmp dummy
# Teamkills: the attack team is red, the defense team is blue
scoreboard objectives add tk.red teamkill.red
scoreboard objectives add tk.blue teamkill.blue

# Kill credit for grenades / traps / ultimates (ctf:match/events/credit)
#   kc.owner - player_id of the owner (on trap markers, grenades, effect clouds)
#   kc.by / kc.time / kc.src - on a player: who hit him, ticks left, source (1 grenade, 2 trap, 3 ultimate)
#   kc.died - the player was killed by a player (vanilla kill credit)
scoreboard objectives add kc.owner dummy
scoreboard objectives add kc.by dummy
scoreboard objectives add kc.time dummy
scoreboard objectives add kc.src dummy
scoreboard objectives add kc.died minecraft.killed_by:minecraft.player
scoreboard objectives add kc.tmp dummy

# Ultimate bar (ctf:match/events/ultimate/render)
scoreboard objectives add ult.dur dummy
scoreboard objectives add ult.tmp dummy

# Shots of bows / crossbows (cancelled during freeze, ctf_inv:freeze_shots)
scoreboard objectives add bow_used minecraft.used:minecraft.bow
scoreboard objectives add xbow_used minecraft.used:minecraft.crossbow

# Guns (ctf_guns): temporary values; assault rifle: shot cooldown, trigger held,
# burst length (spread), rounds in the magazine, reload ticks
scoreboard objectives add gun.tmp dummy
scoreboard objectives add rf.cd dummy
scoreboard objectives add rf.hold dummy
scoreboard objectives add rf.spray dummy
scoreboard objectives add rf.mag dummy
scoreboard objectives add rf.reload dummy

# Sniper rifle (ctf_sniper)
#   sn.aim - ticks of aiming, sn.seen - aimed since the last tick, sn.reload - ticks until the next shot
scoreboard objectives add sn.aim dummy
scoreboard objectives add sn.seen dummy
scoreboard objectives add sn.reload dummy
scoreboard objectives add sn.tmp dummy

# Death camera (ctf:match/events/fight/deathcam): ticks, killer / owner player_id, temporary values
scoreboard objectives add dc.t dummy
scoreboard objectives add dc.killer dummy
scoreboard objectives add dc.owner dummy
scoreboard objectives add dc.tmp dummy

# Effects (ctf_fx): camera shake step
scoreboard objectives add fx.shake dummy

# Loot crates (ctf_loot): falling tick, best task of the round (rarity rank), kills of the round, temporary values
scoreboard objectives add loot.t dummy
scoreboard objectives add loot.best dummy
scoreboard objectives add loot.kills dummy
# Loot crate tasks / rewards: kills of the match, damage taken (tenths of HP), Inferno cooldown, stun ticks
scoreboard objectives add loot.ktotal dummy
scoreboard objectives add loot.dmg minecraft.custom:minecraft.damage_taken
scoreboard objectives add loot.cd dummy
scoreboard objectives add loot.stun dummy
scoreboard objectives add loot.tmp dummy

# Shop (ctf_shop)
# 0 = locked inventory, 1..5 = shop category
scoreboard objectives add shop_category dummy
scoreboard objectives add bought.item dummy
# Number of UI items in slots 9-35 (27 = intact)
scoreboard objectives add shop.n dummy
# Temporary values (#miss, #slot, #ok, #clock, ...)
scoreboard objectives add shop.tmp dummy
# Round limits: items carried at the start of freeze + bought during freeze
scoreboard objectives add shop.lim.he dummy
scoreboard objectives add shop.lim.totem dummy
scoreboard objectives add shop.lim.shield dummy
scoreboard objectives add shop.lim.regen dummy
scoreboard objectives add shop.lim.speed dummy
scoreboard objectives add shop.lim.chorus dummy
scoreboard objectives add shop.lim.smoke dummy

# Inventory layout (ctf_inv)
# Temporary values
scoreboard objectives add inv.tmp dummy
# 1 = exit confirmation (yes/no) is shown in the crafting grid
scoreboard objectives add exit_confirm dummy
# Body armor sets (ctf_inv:armor): id of the assembled set
scoreboard objectives add arm.sid dummy
# "broken" = 1 after the flag has been broken in the current round
scoreboard objectives add flag_state dummy

#########################################
# BOSSBAR

bossbar remove ctf:match
bossbar add ctf:match ""
bossbar set ctf:match visible true
bossbar set ctf:match color pink
bossbar set ctf:match max 300
bossbar set ctf:match style notched_10

#########################################
# OTHER

forceload remove all

kill @e[tag=flag]
kill @e[tag=map_entity]
kill @e[tag=clone_marker]
kill @e[tag=lastDeathMarker]
kill @e[tag=trap]
kill @e[tag=win_trigger]
kill @e[tag=inventory]

#########################################


# Set default settings
function ctf:set_default_settings

# Join to lobby
function ctf:lobby/join_all
