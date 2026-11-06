# As the wallet of the defense bot that buys a trap: paid, the trap counted for the round (one of each
# for the server, like ctf_shop:buy/unique), #payer bots = its bot, #paid bots = 1
$scoreboard players remove @s money $(cost)
$scoreboard players add $(key) bought.item 1
scoreboard players operation #payer bots = @s bot.n
scoreboard players set #paid bots 1
