# LOOT CRATES SETTINGS (run at match start). Full description: MECHANICS.md
#
# During a round (and end_round) an attacker can complete tasks by chance. At the start of the
# next freeze a shulker box with a reward falls for him (for the rarest task he completed),
# onto a landing point of the map (ctf:match/maps/<map>/loot). Only he can open it.

# RARITIES (rank 1..5): sign text, shulker box, falling trail (from_color -> color, RGB 0..1),
# text color, reward (an item for "give"; for now test wool blocks)
data modify storage ctf_loot:config rarities set value {\
    common:    {rank: 1, name: "COMMON",    box: "light_gray_shulker_box", from_color: [0.25f, 0.25f, 0.25f], color: [0.62f, 0.62f, 0.62f], text_color: "gray",        reward: "light_gray_wool"},\
    rare:      {rank: 2, name: "RARE",      box: "blue_shulker_box",       from_color: [0.05f, 0.12f, 0.4f],  color: [0.15f, 0.35f, 1.0f],  text_color: "blue",        reward: "blue_wool"},\
    epic:      {rank: 3, name: "EPIC",      box: "purple_shulker_box",     from_color: [0.22f, 0.03f, 0.35f], color: [0.6f, 0.1f, 0.9f],    text_color: "dark_purple", reward: "purple_wool"},\
    legendary: {rank: 4, name: "LEGENDARY", box: "yellow_shulker_box",     from_color: [0.4f, 0.28f, 0.0f],   color: [1.0f, 0.75f, 0.0f],   text_color: "gold",        reward: "yellow_wool"},\
    mythic:    {rank: 5, name: "MYTHIC",    box: "red_shulker_box",        from_color: [0.2f, 0.0f, 0.01f],   color: [0.55f, 0.0f, 0.03f],  text_color: "dark_red",    reward: "red_wool"}\
}

# TASKS: rarity rank of the crate, chat text (no quotes) and the reward: a function
# ctf_loot:reward/<reward>. A task without "reward" gives the test item of its rarity.
data modify storage ctf_loot:config tasks set value {\
    flag_bring:  {rank: 1, text: "Deliver the flag", reward: "stun"},\
    unkillable:  {rank: 2, text: "Take more than 20 damage in one round and stay alive", reward: "walls"},\
    kills_total: {rank: 3, text: "Kill 10 enemies in this match", reward: "inferno"},\
}
    # flag_break:  {rank: 2, text: "Break the flag"},\
    # enemy_trap:  {rank: 3, text: "Kill an enemy with their own trap"},\
    # fist:        {rank: 4, text: "Kill an enemy with bare hands"},\
    # kills:       {rank: 5, text: "Kill 5 enemies in one round"},\
    # wind:        {rank: 5, text: "Kill an enemy with a flying wind charge"}\

# The "kills" task: how many kills in one round, and the minimum number of enemies in the match
data modify storage ctf_loot:config kills set value {count: 5, min_enemies: 5}

# The "unkillable" task: damage taken in one round (tenths of HP: 200 = 20 HP) - more than that
data modify storage ctf_loot:config unkillable set value {damage: 200}
# The "kills_total" task: kills in the whole match
data modify storage ctf_loot:config kills_total set value {count: 10}
