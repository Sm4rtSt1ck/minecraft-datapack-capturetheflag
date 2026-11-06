# A missed arrow (bow, crossbow): dev degrees to a random side (storage ctf_bots:shot yaw)
execute store result score #m bots run random value 0..1
$execute if score #m bots matches 0 run data modify storage ctf_bots:shot yaw set value $(dev)
$execute if score #m bots matches 1 run data modify storage ctf_bots:shot yaw set value -$(dev)
