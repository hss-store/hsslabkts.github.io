;一番最初に呼び出されるファイル

[title name="ティラノスクリプト解説"]


;ゲームで必ず必要な初期化処理はこのファイルに記述するのがオススメ

;メッセージボックスは非表示
@layopt layer="message0" visible=true

;最初は右下のメニューボタンを非表示にする
[hidemenubutton]

;タイトル画面へ移動
@jump storage="scene1.ks"

[s]