# Random yaw / pitch offset (tenths of a degree -> degrees)
$execute store result storage ctf_sniper:shot yaw float 0.1 run random value $(min)..$(max)
$execute store result storage ctf_sniper:shot pitch float 0.1 run random value $(min)..$(max)
