# The next point of a walk test (feet level of the last point): over a gap: ctf_bots:internal/nav/gap_at;
# a fence / wall: no way; a block at the feet: a step up; no room for the head: no way; the floor
# right below: on; 1 lower: a step down; 2+ lower: a gap (#mode 0 / 2) or a drop of 2-3, deeper a fall
# (#mode 1)
execute if score #jump nav matches 1 run return run function ctf_bots:internal/nav/gap_at
execute if block ~ ~ ~ #ctf_bots:wall run return 0
execute unless block ~ ~ ~ #ctf_bots:gap run return run function ctf_bots:internal/nav/step_up
execute unless block ~ ~1 ~ #ctf_bots:gap run return 0
execute unless block ~ ~-1 ~ #ctf_bots:gap run return run function ctf_bots:internal/nav/walk_on
execute unless block ~ ~-2 ~ #ctf_bots:gap positioned ~ ~-1 ~ run return run function ctf_bots:internal/nav/walk_on
execute unless score #mode nav matches 1 run return run function ctf_bots:internal/nav/gap_start
execute unless block ~ ~-3 ~ #ctf_bots:gap positioned ~ ~-2 ~ run return run function ctf_bots:internal/nav/walk_drop
execute unless block ~ ~-4 ~ #ctf_bots:gap positioned ~ ~-3 ~ run return run function ctf_bots:internal/nav/walk_drop
execute if score #mode nav matches 1 run function ctf_bots:internal/nav/fall_start
