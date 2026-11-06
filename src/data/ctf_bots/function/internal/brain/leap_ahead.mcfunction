# As a bot rotated to its target: a hole 2 deep 1 or 2 blocks ahead -> the jump armed (bot.lt ticks)
execute if block ^ ^-1 ^1 #ctf_bots:gap if block ^ ^-2 ^1 #ctf_bots:gap run return run function ctf_bots:internal/brain/leap_arm
execute if block ^ ^-1 ^2 #ctf_bots:gap if block ^ ^-2 ^2 #ctf_bots:gap run function ctf_bots:internal/brain/leap_arm
