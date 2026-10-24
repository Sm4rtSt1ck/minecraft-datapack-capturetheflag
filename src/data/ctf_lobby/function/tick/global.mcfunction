# #ctf:tick/global: the exit button (warm-up) asks to confirm in the chat
execute as @a[scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[custom_data={action:"exit"}] run \
    tellraw @s [\
        {"text": "To exit, press ", "color": "gold"}, \
        {"text": "here", "color": "red", "clickEvent": {"action": "run_command", "value": "/function ctf_lobby:api/join"}, \
        "hoverEvent": {"action": "show_text", "contents": "*click*"}}\
    ]
