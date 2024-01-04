; 一番最初に呼び出されるファイル.
; 傾聴ログのUser識別用のIDの設定.
@layopt layer="message0" visible="false"
[title name="認知症トレーニングシステム"]

[freeimage  layer="base"  ]
[freeimage  layer="2"  ]

;[bg layer="base" storage="title1.JPG"]

[chara_new name="obasan" storage="obasan1.png" jname="おばあさん"]
[chara_new name="player" storage="obasan1.png" jname="わたし"]
[chara_face name="obasan" face="ge" storage="obasan1.png"]
[chara_face name="obasan" face="komari" storage="obasan3.png"]
[chara_face name="obasan" face="seikou" storage="obasan5.png"]
[chara_face name="obasan" face="yorokobi" storage="obasan7.png"]
[chara_face name="obasan" face="ikari" storage="obasan9.png"]
[chara_face name="obasan" face="naki" storage="obasan11.png"]
[chara_face name="obasan" face="zutuu" storage="obasan13.png"]

; 変数設定.
[eval exp="f.sno = 0"]
[eval exp="check = 0"]
[eval exp="goal = 0"]

[eval exp="f.fb1 = 0"]
[eval exp="f.fb2 = 0"]
[eval exp="f.fb3 = 0"]
[eval exp="f.fb4 = 0"]
[eval exp="f.fb5 = 0"]
[eval exp="f.fb6 = 0"]
[eval exp="f.fb7 = 0"]
[eval exp="f.fb1s = 0"]
[eval exp="f.fb2s = 0"]
[eval exp="f.fb3s = 0"]
[eval exp="f.fb4s = 0"]
[eval exp="f.fb5s = 0"]
[eval exp="f.fb6s = 0"]
[eval exp="f.fb7s = 0"]

[eval exp="f.fb12s =0"]

[eval exp="f.snos = 0"]

[eval exp="f.id = 0"]

[iscript]
  f.id = Math.floor( Math.random() * 1000000)
[endscript]

; マクロの設定---------------------------------------------------------
; 名前無しメッセージウィンドウの表示.
[macro name="anon_dlg"]
    [position layer="message0" width="800" height="300" top="550" left="250" ]
    [position layer="message0" page="fore" frame="frame.png" margint="30" marginl="40" marginr="70" marginb="60"]
    #
[endmacro]

; 名前付きメッセージウィンドウの表示.
[macro name="named_dlg"]
    [position layer="message0" width="800" height="300" top="535" left="250" ]
    [position layer="message0" page="fore" frame="frame1.png" margint="45" marginl="40" marginr="70" marginb="60"]
[endmacro]

[cm]
@jump storage="title.ks" target="*start"
[s]
