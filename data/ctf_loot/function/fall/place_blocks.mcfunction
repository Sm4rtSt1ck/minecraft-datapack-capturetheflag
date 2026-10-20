# The shulker box and a white (pale oak) sign above it: rarity / owner name (sign_name)
$setblock $(x) $(y) $(z) $(box)[facing=up]
$setblock $(x) $(sy) $(z) pale_oak_sign[rotation=0]{is_waxed: 1b, front_text: {has_glowing_text: 1b, messages: ['{"text": "$(name)", "color": "$(text_color)", "bold": true}', '""', '""', '""']}, back_text: {has_glowing_text: 1b, messages: ['{"text": "$(name)", "color": "$(text_color)", "bold": true}', '""', '""', '""']}}
