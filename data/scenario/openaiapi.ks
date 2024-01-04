; OpenAIのAPIリクエスト.
*keityou
;フィードバック用の変数をリセット
[eval exp="f.fb1 = 0"]
[eval exp="f.fb2 = 0"]
[eval exp="f.fb3 = 0"]
[eval exp="f.fb4 = 0"]
[eval exp="f.fb5 = 0"]
[eval exp="f.fb6 = 0"]
[eval exp="f.fb7 = 0"]
[eval exp="f.snos = 0"]
[eval exp="goal = 0"]
[eval exp="check = 0"]

@jump target="*retry"
[s]

*retry
; 入力フォームとボタン作成.
[edit name="tf.keityou_input" color="0x000000" top="400" left="100" width="400"]
[button x="540" y="400" width="300" graphic="input.png" target="*link_gpt"]
[button x="540" y="180" width="300" graphic="kaisou.png" storage="fb.ks" target="*kaisou"]
[s]
*link_gpt
[commit name="tf.keityou_input"]
[cm]
[wait time="1"]
@jump target="*ok"
[s]

*ok
[iscript]
    var API_URL = "https://hsskts.tcpexposer.com/process_request";
    // XMLHttpRequestオブジェクトの生成.
    var xhr = new XMLHttpRequest();
    // リクエストの設定.
    xhr.open("POST", API_URL, true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    // イベントハンドラの設定.
    xhr.onreadystatechange = function() {
        // レスポンスが完了した場合.
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                var responseData = JSON.parse(xhr.responseText);
                //返り値を追加する場合はここ
                response = responseData.response;
                console.log(responseData);
                // 非同期処理完了後のターゲットを実行.
                tyrano.plugin.kag.ftag.startTag("jump", {target: "*after_gpt"});
            } else {
                response = "申し訳ありませんがエラーが発生しました。\n繰り返し表示される場合には管理者に問い合わせして下さい。";
                console.error("Error:", xhr.statusText);
                tyrano.plugin.kag.ftag.startTag("jump", {target: "*after_gpt"});
            }
        }
    };

    var data = JSON.stringify({
        scene_no: f.sno,
        user_id: f.id,
        user_input: tf.keityou_input,
    });
    xhr.send(data);
[endscript]
[s]

*after_gpt
[wait time="1"]
@jump storage="fb.ks" target="*fb"

*end_gpt

[eval exp="f.fb1s = f.fb1s + f.fb1"]
[eval exp="f.fb2s = f.fb2s + f.fb2"]
[eval exp="f.fb3s = f.fb3s + f.fb3"]
[eval exp="f.fb4s = f.fb4s + f.fb4"]
[eval exp="f.fb5s = f.fb5s + f.fb5"]
[eval exp="f.fb6s = f.fb6s + f.fb6"]
[eval exp="f.fb7s = f.fb7s + f.fb7"]
[eval exp="f.fb12s = f.fb1s + f.fb2s"]



[wait time="1"]
[cm]

[return]



