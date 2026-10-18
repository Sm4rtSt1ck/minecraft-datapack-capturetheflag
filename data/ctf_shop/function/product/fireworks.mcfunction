# 5 fireworks for the crossbow: into the offhand if it's empty, otherwise anywhere (ctf_inv sorts it)
$execute unless items entity @s weapon.offhand * run return run item replace entity @s weapon.offhand with firework_rocket[custom_name='"Firework"', custom_data={tags:[""]}, fireworks={explosions:[\
    {shape:"small_ball",colors:[I;$(colors)],fade_colors:[I;$(fade)]},\
    {shape:"small_ball",colors:[I;$(colors)],fade_colors:[I;$(fade)]},\
    {shape:"small_ball",colors:[I;$(colors)],fade_colors:[I;$(fade)]},\
    {shape:"small_ball",colors:[I;$(colors)],fade_colors:[I;$(fade)]},\
    {shape:"small_ball",colors:[I;$(colors)],fade_colors:[I;$(fade)]},\
    {shape:"small_ball",colors:[I;$(colors)],fade_colors:[I;$(fade)]},\
    {shape:"small_ball",colors:[I;$(colors)],fade_colors:[I;$(fade)]}\
]}] 5

$give @s firework_rocket[custom_name='"Firework"', custom_data={tags:[""]}, fireworks={explosions:[\
    {shape:"small_ball",colors:[I;$(colors)],fade_colors:[I;$(fade)]},\
    {shape:"small_ball",colors:[I;$(colors)],fade_colors:[I;$(fade)]},\
    {shape:"small_ball",colors:[I;$(colors)],fade_colors:[I;$(fade)]},\
    {shape:"small_ball",colors:[I;$(colors)],fade_colors:[I;$(fade)]},\
    {shape:"small_ball",colors:[I;$(colors)],fade_colors:[I;$(fade)]},\
    {shape:"small_ball",colors:[I;$(colors)],fade_colors:[I;$(fade)]},\
    {shape:"small_ball",colors:[I;$(colors)],fade_colors:[I;$(fade)]}\
]}] 5
