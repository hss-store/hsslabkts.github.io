*op
[position layer=message0 width=800 height=300 top=550 left=250 ]
[position layer=message0 page=fore frame="frame.png" margint="45" marginl="40" marginr="70" marginb="60"]
[cm]

[bg storage=ribingu.jpg time=1][cm]
[wait time=10]

[playse storage="nare1.ogg"]あなたは認知症を患うおばあさんと一緒に暮らしています。[wait time=6][cm]

[playse storage="nare2.ogg"]おばあさんと上手くコミュニケーションを取り合い、落ち着いて１日を過ごしましょう。[wait time=7][cm]

[playse storage="nare3.ogg"]
朝です。[wait time=3][cm]

[chara_new name="obasan" storage="obasan1.png" jname="おばあさん"]
[chara_new name="player" storage="obasan1.png" jname="わたし"]
[chara_face name="obasan" face="komari" storage="obasan3.png"]
[chara_face name="obasan" face="seikou" storage="obasan5.png"]
[chara_face name="obasan" face="yorokobi" storage="obasan7.png"]
[chara_face name="obasan" face="ikari" storage="obasan9.png"]
[chara_face name="obasan" face="naki" storage="obasan11.png"]
[chara_face name="obasan" face="zutuu" storage="obasan13.png"]

[chara_show name="obasan" top=50]
[playse storage="nare4.ogg"]
おばあさんが起きてきたようです。[wait time=3][cm]
[position layer=message0 width=800 height=300 top=535 left=250 ]
[position layer=message0 page=fore frame="frame1.png" margint="45" marginl="40" marginr="70" marginb="60"]
[ptext name="chara_name_area" layer=message0 width="200" color=white x=280 y=540 size=26]
[chara_config ptext="chara_name_area"]

#obasan
[playse storage="npc1.ogg"]
おはよう。[wait time=2][cm]

#player
[playse storage="play1.ogg"]
おはよう。 [wait time=2][cm]

@jump storage="scenario.ks" target="*start1"