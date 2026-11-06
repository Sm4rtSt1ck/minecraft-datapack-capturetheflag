# A walk test reached its node: the kind of the way (1 walk, 2 narrow: 3+ narrow steps, 3 jump, 4 drop,
# 7 fall: more than 3 blocks)
scoreboard players set #ok nav 1
execute if score #narrow nav matches 3.. run scoreboard players set #ok nav 2
execute if score #drop nav matches 1 run scoreboard players set #ok nav 4
execute if score #jump nav matches 2 run scoreboard players set #ok nav 3
execute if score #fall nav matches 4.. run scoreboard players set #ok nav 7
