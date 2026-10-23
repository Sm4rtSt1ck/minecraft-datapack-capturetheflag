# Points between the last step and this one (#fh gun.tmp = 1: the bullet stopped there)
execute positioned ^ ^ ^-0.375 unless block ~ ~ ~ #ctf_guns:passable if function ctf_guns:ray/solid run return run function ctf_guns:ray/fine_hit
execute positioned ^ ^ ^-0.25 unless block ~ ~ ~ #ctf_guns:passable if function ctf_guns:ray/solid run return run function ctf_guns:ray/fine_hit
execute positioned ^ ^ ^-0.125 unless block ~ ~ ~ #ctf_guns:passable if function ctf_guns:ray/solid run return run function ctf_guns:ray/fine_hit
