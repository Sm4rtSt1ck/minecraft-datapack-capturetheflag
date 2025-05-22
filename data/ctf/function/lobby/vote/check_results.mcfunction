scoreboard players reset max map_vote
scoreboard players reset tie map_vote
scoreboard players reset choice map_vote
scoreboard players reset result map_vote
scoreboard players reset total_map_1 map_vote
scoreboard players reset total_map_2 map_vote
scoreboard players reset total_map_3 map_vote

execute as @a run function ctf:lobby/vote/count_single

scoreboard players operation max map_vote = total_map_1 map_vote
execute if score max map_vote < total_map_2 map_vote run scoreboard players operation max map_vote = total_map_2 map_vote
execute if score max map_vote < total_map_3 map_vote run scoreboard players operation max map_vote = total_map_3 map_vote
# tellraw @a [{"text": "Map 1 vote: "}, {"score": {"name": "total_map_1", "objective": "map_vote"}}]
# tellraw @a [{"text": "Map 2 vote: "}, {"score": {"name": "total_map_2", "objective": "map_vote"}}]
# tellraw @a [{"text": "Map 3 vote: "}, {"score": {"name": "total_map_3", "objective": "map_vote"}}]
# tellraw @a [{"text": "Max map vote: "}, {"score": {"name": "max", "objective": "map_vote"}}]

execute if score max map_vote = total_map_1 map_vote run scoreboard players add tie map_vote 1
execute if score max map_vote = total_map_2 map_vote run scoreboard players add tie map_vote 1
execute if score max map_vote = total_map_3 map_vote run scoreboard players add tie map_vote 1
# tellraw @a [{"text": "Tie: "}, {"score": {"name": "tie", "objective": "map_vote"}}]

scoreboard players operation choice map_vote = random number
# tellraw @a [{"text": "Random number: "}, {"score": {"name": "choice", "objective": "map_vote"}}]
scoreboard players operation choice map_vote %= tie map_vote
scoreboard players add choice map_vote 1
# tellraw @a [{"text": "Choice % tie + 1: "}, {"score": {"name": "choice", "objective": "map_vote"}}]

execute if score total_map_1 map_vote = max map_vote run scoreboard players remove choice map_vote 1
execute if score total_map_1 map_vote = max map_vote if score choice map_vote matches 0 run scoreboard players set result map_vote 1
# tellraw @a [{"text": "Choice after 1: "}, {"score": {"name": "choice", "objective": "map_vote"}}]

execute if score total_map_2 map_vote = max map_vote run scoreboard players remove choice map_vote 1
execute if score total_map_2 map_vote = max map_vote if score choice map_vote matches 0 run scoreboard players set result map_vote 2
# tellraw @a [{"text": "Choice after 2: "}, {"score": {"name": "choice", "objective": "map_vote"}}]

execute if score total_map_3 map_vote = max map_vote run scoreboard players remove choice map_vote 1
execute if score total_map_3 map_vote = max map_vote if score choice map_vote matches 0 run scoreboard players set result map_vote 3
# tellraw @a [{"text": "Choice after 3: "}, {"score": {"name": "choice", "objective": "map_vote"}}]

execute as @a run function ctf:match/start
