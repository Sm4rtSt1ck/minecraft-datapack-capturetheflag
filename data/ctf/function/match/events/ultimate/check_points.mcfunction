execute unless score game state = freeze state if score @s ultimate >= max ultimate run function ctf:match/events/ultimate/start
execute unless score game state = freeze state unless score @s ultimate >= max ultimate run tellraw @s {"text": "Not enough ultimate points!", "color": "red"}
execute if score game state = freeze state run tellraw @s {"text": "The ultimate cannot be used during the setup phase!", "color": "red"}
