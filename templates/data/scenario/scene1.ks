;ティラノスクリプトサンプルゲーム

*start

[cm  ]
[clearfix]
[start_keyconfig]

[bg storage="room.jpg" time="100"]

#
今日は、ティラノスクリプトに、
JavaScriptでGPT3.5のAPIを組み込んでみました。
自由にしゃべってみましょう。[p]
#
というわけで、何か御用ですか？[p]
*input
[cm]
[edit name="tf.test" top=100 left=100 width=200]
[button x=400 y=100 target="*ok" graphic="button/auto.png"]
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
tyrano.plugin.kag.ftag.startTag("jump", {target: "*error"});
}
}
};
// データの送信（これがプロンプトだよ！）
var data = JSON.stringify({
system_input: "ユーザーを「わが師」と呼びます。返答は５０字以内です。名前はケレス。一人称は僕。慇懃で丁寧です。手に持っているのは名刺です。好きなものは我が師。例「これは技術デモです。我が師」",
user_input: tf.test
});
xhr.send(data);
[endscript]
[s] ; この部分でスクリプトを止める
*after_api
[emb exp="tf.response"]
; 「次へ」ボタンを表示して、クリックされたら *input へジャンプ
[button graphic="arrow_next.png" x="100" y="150" target="*input"]
; ここで処理は停止し、ボタンがクリックされるのを待つ
[s]