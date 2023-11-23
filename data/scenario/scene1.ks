;ティラノスクリプトサンプルゲーム

*start
;[freeimage  layer="base"  ]
;[freeimage  layer="2"  ]

;@layopt layer=message0 visible=false
[layopt layer=0 visible=true]
[layopt layer=1 visible=true]
[layopt layer=2 visible=true]

[bg layer=0 storage="room.jpg" time="100"]

;キャラ定義
[chara_new name="obasan" storage="chara/akane/normal.png" jname="おばあさん"]

[cm]

[position layer=message0 width=800 height=300 top=535 left=250 ]
[position layer=message0 page=fore frame="frame1.png" margint="45" marginl="40" marginr="70" marginb="60"]

[ptext name="chara_name_area" layer=message0 width="200" color=white x=275 y=537 size=28]
[chara_config ptext="chara_name_area"]

@wait time = 100

#obasan
ティラノスクリプトにJavaScriptで
GPT3.5のAPIを組み込んでみました。[p]
自由にしゃべってみましょう。[p]
#obasan
というわけで、何か御用ですか？[p]
*input
[cm]
[edit name="tf.test" top=100 left=100 width=200]
[button x=400 y=100 target="*ok" graphic="button_blue.png"]
[s]
*ok
[commit]
[cm]
[jump target="*next"]
[s]
*next
[iscript]
var API_URL = "https://hsskts.tcpexposer.com/process_request";
// XMLHttpRequest オブジェクトの生成 (毎回新しく生成)
var xhr = new XMLHttpRequest();
// リクエストの設定
xhr.open("POST", API_URL, true);
xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
// イベントハンドラの設定
xhr.onreadystatechange = function() {
// レスポンスが完了した場合
if (xhr.readyState == 4) {
if (xhr.status == 200) {
var responseData = JSON.parse(xhr.responseText);
tf.response = responseData.response;
console.log(responseData);
// 非同期処理完了後のターゲットを実行
tyrano.plugin.kag.ftag.startTag("jump", {target: "*after_api"});
} else {
tf.response = "失敗しちゃったみたい。";
console.error("Error:", xhr.statusText);
// エラー時のターゲットも設定可能
tyrano.plugin.kag.ftag.startTag("jump", {target: "*after_api"});
}
}
};
// データの送信（これがプロンプトだよ！）
var data = JSON.stringify({
system_input: "エージェントとして認知症を患う80歳の女性を演じてください。私はエージェントの子であり、私のことを「あなた」と呼びます。返答は５０字以内です。名前はおばあさん。一人称は「私」。例「今日の天気はいいわねぇ」「朝ごはんはまだかねぇ」",
user_input: tf.test
});



xhr.send(data);
[endscript]
[s]
*after_api
[emb exp="tf.response"]
; 「次へ」ボタンを表示して、クリックされたら *input へジャンプ
[button graphic="button_blue.png" x="100" y="150" target="*input"]
; ここで処理は停止し、ボタンがクリックされるのを待つ
[s]