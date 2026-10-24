# pid: the best task of this player -> its reward function (if it has one)
data remove storage ctf_loot:tmp rw.task
$data modify storage ctf_loot:tmp rw.task set from storage ctf_loot:best players.p$(pid)
execute if data storage ctf_loot:tmp rw.task run function ctf_loot:internal/reward_of_task with storage ctf_loot:tmp rw
