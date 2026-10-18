execute if score #reason econ.tmp matches 1 run return run function ctf_econ:give {key: "win.flag", reason: "round win (the flag was delivered)"}
execute if score #reason econ.tmp matches 2 run return run function ctf_econ:give {key: "win.noflag", reason: "round win (the flag was not placed)"}
execute if score #reason econ.tmp matches 3 run return run function ctf_econ:give {key: "win.elim", reason: "round win (all attackers eliminated)"}
function ctf_econ:give {key: "win.timeout", reason: "round win (the time is over)"}
