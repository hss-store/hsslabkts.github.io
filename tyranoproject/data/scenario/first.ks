; 一番最初に呼び出されるファイル.
; 傾聴ログのUser識別用のIDの設定.
@layopt layer="message0" visible="false"
[iscript]
  tf.id = Math.floor( Math.random() * 1000000)
[endscript]


[title name="認知症患者傾聴トレーニングシステム"]

[freeimage  layer="base"  ]
[freeimage  layer="2"  ]

[bg layer="base" storage="title1.JPG"]

[chara_new name="obasan" storage="obasan1.png" jname="おばあさん"]
[chara_new name="player" storage="obasan1.png" jname="わたし"]
[chara_face name="obasan" face="komari" storage="obasan3.png"]
[chara_face name="obasan" face="seikou" storage="obasan5.png"]
[chara_face name="obasan" face="yorokobi" storage="obasan7.png"]
[chara_face name="obasan" face="ikari" storage="obasan9.png"]
[chara_face name="obasan" face="naki" storage="obasan11.png"]
[chara_face name="obasan" face="zutuu" storage="obasan13.png"]

; 変数設定.
[eval exp="sno = 0"]
[eval exp="f.situnin = 0"]
[eval exp="f.kioku = 0"]
[eval exp="f.kentousiki = 0"]
[eval exp="f.ninnti = 0"]
[eval exp="f.ans1 = 0"]
[eval exp="f.ans2 = 0"]
[eval exp="f.ans3 = 0"]
[eval exp="f.ans4 = 0"]
[eval exp="f.ans5 = 0"]
[eval exp="f.ans6 = 0"]
[eval exp="f.ans7 = 0"]
[eval exp="f.ans8 = 0"]
[eval exp="f.ans9 = 0"]
[eval exp="f.ans10 = 0"]
[eval exp="f.ans11 = 0"]
[eval exp="f.ans12 = 0"]
[eval exp="f.ans13 = 0"]
[eval exp="f.ans14 = 0"]
[eval exp="f.ans15 = 0"]
[eval exp="f.scene = 0"]
[eval exp="sfb_no = 0"]

; マクロの設定---------------------------------------------------------
; 名前無しメッセージウィンドウの表示.
[macro name="anon_dlg"]
    [position layer=message0 width=800 height=300 top=550 left=250 ]
    [position layer=message0 page=fore frame="frame.png" margint="45" marginl="40" marginr="70" marginb="60"]
[endmacro]

; 名前付きメッセージウィンドウの表示.
[macro name="named_dlg"]
    [position layer=message0 width=800 height=300 top=535 left=250 ]
    [position layer=message0 page=fore frame="frame1.png" margint="45" marginl="40" marginr="70" marginb="60"]
[endmacro]

; タイマーの削除処理.
[macro name="timeroff"]
    [wait_cancel]
    [cm]
    [clearstack stack="call"]
    [free layer="0" name="timer"]
    [free layer="0" name="timer_image"]
[endmacro]


; OpenAIのAPIリクエスト.
[macro name="api_input"]
    [cm]
    ; シナリオの識別.
    [eval exp="sce_no = sno"]
    *retry
    ; 入力フォームとボタン作成.
    [edit name="tf.keityou_input" top=100 left=100 width=200]
    [button x=400 y=100 target="*link_gpt" graphic="button_blue.png"]
    [s]
    *link_gpt
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
        tf.response = responseData.response;
        console.log(responseData);
        // 非同期処理完了後のターゲットを実行.
        tyrano.plugin.kag.ftag.startTag("jump", {target: "*after_gpt"});
        } else {
        tf.response = "申し訳ありませんがエラーが発生しました。\n繰り返し表示される場合には管理者に問い合わせして下さい。";
        console.error("Error:", xhr.statusText);
        tyrano.plugin.kag.ftag.startTag("jump", {target: "*after_gpt"});
        }
        }
        };

        var data = JSON.stringify({
            scene_no: sce_no
            user_input: tf.keityou_input
            user_id: tf.id
        });
        xhr.send(data);
    [endscript]
    [s]

    *after_gpt
    [cm]
    [named_dlg]
    [emb exp="tf.response"]
    [eval exp="sfb_no = m_no"]
    [anon_dlg]
    [if exp="sfb_no = 1"]
        声掛けをする際に、おばあさんの[r]
        意思を無視してしまっているかもしれません。
    [elsif exp="sfb_no = 2"]
        おばあさんの気持ちを考えながら[r]
        声掛けすると良いかもしれません。
    [elsif exp="sfb_no = 3"]
        おばあさんに寄り添った声掛けができています。[r]
        とても良いですね！
    [elsif exp="sfb_no = 4"]
        認知症患者が朝ごはんを食べない理由。[r]
        どのような理由があるでしょうか？
    [elsif exp="sfb_no = 5"]
        声掛けに曖昧な表現があることで[r]
        混乱させてしまっているかもしれません。
    [elsif exp="sfb_no = 6"]
        どうやら、朝ごはんが認識できずに困っていたようですね。
    [else]

    [endif]
    [button graphic="button_blue.png" x="100" y="150" target="*retry"]
    [s]
[endmacro]

[cm]
@jump storage="title.ks" target="*start"
[s]
