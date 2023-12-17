*start
;メッセージボックスは非表示表示するときはtrueに.
@layopt layer="message0" visible="false"
[image storage="title.png" visible="true" top="100" left="150"]
[glink x="450" y="500" text="はじめる" target="*gamestart"]
[s]

*gamestart
[cm]
[freeimage layer=1]
;メッセージレイヤを再度表示する.
@layopt layer="message0" visible="true"
[jump target="*ex"]
[s]

*ex
[wait_cancel]
[resetfont]
[freeimage  layer="base"  ]
[freeimage  layer="2"  ]
[position layer="message0" frame="none" color="0x000000" opacity="350"]
[position width="1200" height="700" left="50" top="10"]
[position margint="5" marginr="5" marginb="5" marginl="25"]
/*
進行の仕方[r]
・ストーリーはクリックして進行してください[r]
・おばあさんとの会話の中で入力ボックスが表示されます。[r]
・入力ボックスにあなたならどうするか介護方法を入力して下さい。[r]
・また、ストーリーの最後に会話の選択肢が表示されます。[r]
・最も正しいと思う選択肢を一つ選んでクリックしてください。[r]
・問題を解いた後に症状についての説明がされます。[r]
・問題は全部で15問です。
・終了したら先ほどのMicrosoft Formsに戻っていただき事後調査とアンケートを行ってください。[r]
・スタートボタンを押して開始。[r]
*/
[glink x="450" y="630" text="スタート" storage="scene0.ks" target="*op" ]
[s]


