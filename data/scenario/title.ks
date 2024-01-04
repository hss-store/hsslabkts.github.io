*start
[cm]
[freeimage layer="1"]
;メッセージレイヤを再度表示する.
@layopt layer="message0" visible="true"
[wait_cancel]
[resetfont]

[freeimage  layer="base"]
[freeimage  layer="2"]
[position layer="message0" frame="none" color="0x555555" opacity="350"]
[position width="1200" height="700" left="50" top="10"]
[position margint="50" marginr="5" marginb="5" marginl="25"]

進行の仕方[r]
・ストーリーは自動で進行します。[r]
・音声が出力されるのでご注意ください。[r]
・声かけ場面では入力ボックスが表示されます。[r]
・入力ボックスにあなたならどうするかを入力してボタンを押して下さい。[r]
・声かけ場面では、クリックでメッセージを送ります。[r]
・問題は全部で8問です。[r]
・スタートボタンを押して開始。

[glink x="450" y="630" text="スタート" storage="scene1.ks" target="*op"]
[s]

/*
[glink x="10" y="10" text="1" storage="scenario.ks" target="*scn1" width="6" height="10"]
[glink x="10" y="70" text="2" storage="scenario.ks" target="*scn2" width="6" height="10"]
[glink x="10" y="130" text="3" storage="scenario.ks" target="*scn3" width="6" height="10"]
[glink x="10" y="250" text="4" storage="scenario.ks" target="*scn5" width="6" height="10"]
[glink x="10" y="310" text="5" storage="scenario.ks" target="*scn6" width="6" height="10"]
[glink x="10" y="370" text="6" storage="scenario.ks" target="*scn7" width="6" height="10"]
[glink x="200" y="10" text="7" storage="scenario.ks" target="*scn8" width="6" height="10"]
[glink x="200" y="70" text="8" storage="scenario.ks" target="*scn9" width="6" height="10"]
[glink x="200" y="130" text="9" storage="scenario.ks" target="*scn10" width="6" height="10"]
[s]*/
;[glink x="450" y="630" text="スタート" storage="scenario.ks" target="*scn2"]
