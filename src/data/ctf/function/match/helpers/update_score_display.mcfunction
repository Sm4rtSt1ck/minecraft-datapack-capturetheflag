execute if score match rounds < swap rounds run \
    bossbar set ctf:match name [\
        {"color":"blue","score":{"name":"team_2","objective":"rounds"}, "bold": true},\
        {"color":"dark_purple","text":" | "},\
        {"color":"red","score":{"name":"team_1","objective":"rounds"}}\
    ]
execute if score match rounds >= swap rounds run \
    bossbar set ctf:match name [\
        {"color":"blue","score":{"name":"team_1","objective":"rounds"}, "bold": true},\
        {"color":"dark_purple","text":" | "},\
        {"color":"red","score":{"name":"team_2","objective":"rounds"}}\
    ]
