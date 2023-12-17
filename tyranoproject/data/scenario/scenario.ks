*start1


;朝食---------------------------------------------------------------
*scn1
[chara_show name="obasan" top=50]
[anon_dlg]
#
[playse storage="nare5.ogg"]
食事の時間です。[wait time=3][cm]
[playse storage="nare6.ogg"]
おばあさんと食事をしましょう。[wait time=3][cm]
[playse storage="nare7.ogg"]
おばあさんが食卓にやってきたようです。[wait time=4][cm]
[named_dlg]
#player
[playse storage="play2.ogg"]
おばあさん、そろそろ食事にしましょう！[wait time=4][cm]
#obasan
・・・[wait time=2][cm]
[anon_dlg]
#
[playse storage="nare8.ogg"]
おばあさんはなかなか食事を始めません。[wait time=5][cm]
; [playse storage="nare9.ogg"]
; どうやら、食べ方がわからないようです。[wait time=3][cm]
[playse storage="nare10.ogg"]
おばあさんに声をかけてみましょう。[wait time=300][cm]

[eval exp="sno = 1"]
[api_input]
[s]


選択肢を選んでください。
[glink x="250" y="300" text="1:さ！食べよう！" target="*scn1_react1" exp="f.ans1 = 1"]
[glink x="650" y="300" text="2:美味しいですよ！" target="*scn1_react1" exp="f.ans1 = 1"]
[glink x="150" y="400" text="3:食べられますか？" target="*scn1_react2" exp="f.ans1 = 0"]
[glink x="800" y="400" text="4:ご飯ですよ！" target="*scn1_react2" exp="f.ans1 = 0"]
[call target="*Sub_CountDown"]
;時間切れ
@jump target="*scn1_react2"


*scn1_react1
[timeroff]
[chara_mod name="obasan" face="seikou"]
[playse storage="nare11.ogg"]
おばあさんは食事を始めてくれたようです。[wait time=5000][cm]
[playse storage="nare12.ogg"]
食事をとれたので歯磨きをしてもらいましょう。[wait time=5000][cm]
@jump target="*scn2"


*scn1_react2
[timeroff]
[chara_mod name="obasan" face="komari"]
[playse storage="nare13.ogg"]
おばあさんはしぶしぶ食事を始めてくれたようです・・・[wait time=5000][cm]
[playse storage="nare12.ogg"]
食事をとれたので歯磨きをしてもらいましょう。[wait time=5000][cm]
@jump target="*scn2"


;歯磨き---------------------------------------------------------------
*scn2
[wait_cancel]
[cm]
[chara_hide name=obasan]
[bg storage=senmen.jpg time=3000][cm]
[chara_show name="obasan" top=50]
[chara_mod name="obasan" face="komari"]
[playse storage="nare14.ogg"]
おばあさんに歯磨きをしてもらおうとしても口を開けてくれません。
[wait time=5000][cm]
[playse storage="nare15.ogg"]
おばあさんに声をかけてみましょう。[wait time=3000][cm]



選択肢を選んでください。
[glink x="150" y="300" text="1:頑張って口を開けさせる"  target="*scn2_react2" exp="f.ans2 = 0"]
[glink x="650" y="300" text="2:自分が歯磨きをする"  target="*scn2_react1" exp="f.ans2 = 1"]
[glink x="250" y="400" text="3:時間をおいてみる" s target="*scn2_react1" exp="f.ans2 = 1"]
[glink x="650" y="400" text="4:歯磨きをしてあげる"  target="*scn2_react2" exp="f.ans2 = 0"]
[call target="*Sub_CountDown"]
@jump target="*scn2_react2"

*scn2_react1
[wait_cancel]
[cm]
[clearstack stack="call" ]
[free layer="0" name="timer"]
[free layer="0" name="timer_image"]
[chara_mod name="obasan" face="seikou"]
[playse storage="nare16.ogg"]
おばあさんは歯磨きを始めてくれました！[wait time=6000][cm]
[eval exp="f.eat = 1"]
[eval exp="f.sikkou1 = 1"]
[chara_hide name=obasan]
@jump target="*scn3"

*scn2_react2
[timeroff]
[chara_mod name="obasan" face="ikari"]
[playse storage="nare17.ogg"]
おばあさんは歯磨きを拒否してどこかに行ってしまいました・・・[wait time=6000][cm]
[eval exp="f.eat = 1"]
[eval exp="f.sikkou1 = 1"]
[chara_hide name=obasan]
@jump target="*scn3"

;同じことを何度も言う---------------------------------------------------------------
*scn3
[bg storage=ribingu.jpg time=10][cm]
[chara_show name="obasan" top=50]
[named_dlg]
#obasan
[playse storage="npc13.ogg"]
ねぇ、お米を注文しておいてくれる？[wait time=4000][cm]
#player
[playse storage="play9.ogg"]
はい、わかりました。[wait time=3000][cm]
[anon_dlg]
#
数時間後・・・[wait time=2000][cm]
[named_dlg]
#obasan
[playse storage="npc13.ogg"]
ねぇ、お米を注文しておいてくれる？[wait time=4000][cm]
[anon_dlg]
#
[playse storage="nare65.ogg"]
どうやらおばあさんは数時間前に話したことを忘れてしまい同じ話をしているようです。[wait time=8000][cm]
[playse storage="nare66.ogg"]
おばあさんに声をかけてみましょう。[wait time=3000][cm]



選択肢を選んでください。
[glink x="200" y="300" text="1:お米はまだありますよ"  target="*scn3_u1" exp="f.ans3 = 1"]
[glink x="650" y="300" text="2:お茶にしましょう" target="*scn3_u2" exp="f.ans3 = 1"]
[glink x="100" y="400" text="3:さっきも同じ話をしましたよ" target="*scn3_u3" exp="f.ans3 = 0"]
[glink x="650" y="400" text="4:いい加減にしてください"  target="*scn3_u4" exp="f.ans3 = 0"]
[call target="*Sub_CountDown"]
@jump target="*scn3_react2"

*scn3_u1
[timeroff]
#player
[playse storage="ans10-1.ogg"]
お米はまだありますよ[wait time=3000][cm]
@jump target="*scn3_react1"

*scn3_u2
[timeroff]
#player
[playse storage="ans13-4.ogg"]
お茶にしましょう[wait time=2000][cm]
@jump target="*scn3_react1"

*scn3_u3
[timeroff]
#player
[playse storage="ans10-3.ogg"]
さっきも同じ話をしましたよ[wait time=4000][cm]
@jump target="*scn3_react2"

*scn3_u4
[timeroff]
#player
[playse storage="ans10-4.ogg"]
いい加減にしてください[wait time=3000][cm]
@jump target="*scn3_react2"

*scn3_react1
[timeroff]
[named_dlg]
[chara_mod name="obasan" face="seikou"]
#obasan
[playse storage="npc14.ogg"]
あら、分かったわ。[wait time=3000][cm]
[anon_dlg]
#
[playse storage="nare56.ogg"]
おばあさんは落ち着いたようです[wait time=3000][cm]
[eval exp="f.kioku2 = 1"]
[chara_hide name=obasan]
@jump target="*scn4"

*scn3_react2
[timeroff]
[named_dlg]
[chara_mod name="obasan" face="naki"]
#obasan
[playse storage="npc15.ogg"]
拒否された・・・[wait time=2000][cm]
[anon_dlg]
#
[playse storage="nare67.ogg"]
おばあさんは、落ち込んでしまいました。[wait time=4000][cm]
[eval exp="f.kioku2 = 1"]
[chara_hide name=obasan]
@jump target="*scn4"



;食事をしたことを忘れる---------------------------------------------------------------
*scn4
[bg storage=ribingu.jpg time=10][cm]
[chara_show name="obasan" top=50]
[named_dlg]
[chara_mod name="obasan" face="komari"]
#obasan
[playse storage="npc16.ogg"]
朝ごはんはまだかい？
[wait time=3000][cm]
[chara_mod name="obasan" face="ikari"]
[playse storage="npc17.ogg"]
朝ごはんはまだかい！
[wait time=2000][cm]
[anon_dlg]
#
[playse storage="nare68.ogg"]
おばあさんは朝ごはんを食べたことを忘れて騒ぎ始めてしまいました。
[wait time=6000][cm]
[playse storage="nare69.ogg"]
声をかけて落ち着かせましょう。
[wait time=3000][cm]




選択肢を選んでください。
[glink x="100" y="300" text="1:さっき食べたばかりですよ"  target="*scn4_u1" exp="f.ans4 = 0"]
[glink x="650" y="300" text="2:今日は面白いテレビやってるかな？"  target="*scn4_u2" exp="f.ans4 = 1"]
[glink x="100" y="400" text="3:まだできないよ、もう少し待ってね"  target="*scn4_u3" exp="f.ans4 = 1"]
[glink x="750" y="400" text="4:もうお腹空いたんですか？"  target="*scn4_u4" exp="f.ans4 = 0"]
[call target="*Sub_CountDown"]
@jump target="*scn4_react2"

*scn4_u1
[timeroff]
[playse storage="ans11-3.ogg"]
#player
さっき食べたばかりですよ。
[wait time=3000][cm]
@jump  target="*scn4_react2"

*scn4_u2
[timeroff]
[playse storage="ans11-1.ogg"]
#player
今日は面白いテレビやってるかな？
[wait time=4000][cm]
@jump  target="*scn4_react1"


*scn4_u3
[timeroff]
[playse storage="ans11-2.ogg"]
#player
まだできないよ、もう少し待ってね
[wait time=4000][cm]
@jump  target="*scn4_react1"

*scn4_u4
[timeroff]
[playse storage="ans11-4.ogg"]
#player
もうお腹空いたんですか？
[wait time=3000][cm]
@jump  target="*scn4_react2"


*scn4_react1
[timeroff]
[anon_dlg]
[chara_mod name="obasan" face="seikou"]
[playse storage="nare70.ogg"]
#
おばあさんは落ち着いてくれたようです。[wait time=4000][cm]
[eval exp="f.kioku3 = 1"]
[chara_hide name=obasan]
@jump target="*scn5"


*scn4_react2
[timeroff]
[named_dlg]
[chara_mod name="obasan" face="ikari"]
[playse storage="npc18.ogg"]
#obasan
なぜごはんを食べさせてくれないの！[wait time=3000][cm]
[anon_dlg]
#
[playse storage="nare71.ogg"]
おばあさんはあなたのことを食事をさせてくれない[r]
ひどい人だと認識してしまいました・・・[wait time=7000][cm]
[eval exp="f.kioku3 = 1"]
[chara_hide name=obasan]
@jump target="*scn5"


;異食---------------------------------------------------------------
*scn5
[bg storage=ribingu.jpg time=10][cm]
[chara_show name="obasan" top=50]
[chara_mod name="obasan" face="komari"]
[named_dlg]
#obasan
[playse storage="npc5.ogg"]
お腹が空いたわ[wait time=2000][cm]
[playse storage="npc6.ogg"]
ずっと何も食べていない気がするし・・・[wait time=4000][cm]
[anon_dlg]
#
[playse storage="nare29.ogg"]
おばあさんはどうやらお腹が空いたと感じているようです。[wait time=5000][cm]
[named_dlg]
#obasan
[playse storage="npc7.ogg"]
これは昨日食べたサラダの残りかしら？[wait time=4000][cm]
[anon_dlg]
#
[playse storage="nare30.ogg"]
おばあさんは、テーブルの上に落ちていた植物の葉っぱをサラダだと思い口に入れてしまいました。[wait time=8000][cm]
[playse storage="nare31.ogg"]
あなたはそれを目撃しました。[wait time=3000][cm]
[playse storage="nare32.ogg"]
声をかけましょう[wait time=3000][cm]



選択肢を選んでください。
[glink x="50" y="300" text="1:こっちのほうが美味しいですよ" target="*scn5_u1" exp="f.ans5 = 1"]
[glink x="650" y="300" text="2:何を食べているの？" target="*scn5_u2" exp="f.ans5 = 1"]
[glink x="50" y="400" text="3:口に入れたものを見せてください" target="*scn5_u3" exp="f.ans5 = 0"]
[glink x="650" y="400" text="4:口から出してください" target="*scn5_u4" exp="f.ans5 = 0"]
[call target="*Sub_CountDown"]
@jump target="*scn5_react2"

*scn5_u1
[timeroff]
#player
[playse storage="ans3-1.ogg"]
こっちのほうが美味しいですよ[wait time=3000][cm]
@jump target="*scn5_react1"

*scn5_u2
[timeroff]
#player
[playse storage="ans3-2.ogg"]
何を食べているの？[wait time=2000][cm]
@jump target="*scn5_react1"

*scn5_u3
[timeroff]
#player
[playse storage="ans3-3.ogg"]
口に入れたものを見せてください[wait time=3000][cm]
@jump target="*scn5_react2"

*scn5_u4
[timeroff]
#player
[playse storage="ans3-4.ogg"]
口から出してください[wait time=3000][cm]
@jump target="*scn5_react2"

*scn5_react1
[timeroff]
#
[anon_dlg]
[chara_mod name="obasan" face="seikou"]
[playse storage="nare33.ogg"]
おばあさんは口から葉っぱを吐き出してくれました。[wait time=5000][cm]
[eval exp="f.situnin2 = 1"]
[chara_hide name=obasan]
@jump target="*scn6"

*scn5_react2
[timeroff]
#
[anon_dlg]
[chara_mod name="obasan" face="zutuu"]
[playse storage="nare34.ogg"]
おばあさんは葉っぱを飲み込んでしまいました・・・[wait time=4000][cm]
[eval exp="f.situnin2 = 1"]
[chara_hide name=obasan]
@jump target="*scn6"



;鏡に映った自分に話しかける---------------------------------------------------------------
*scn6
[bg storage=ribingu.jpg time=10][cm]
[chara_show name="obasan" top=50]
[named_dlg]
#obasan
・・・！[r]
[playse storage="npc8.ogg"]
あら、久しぶりに会いましたね。[wait time=3000][cm]
[playse storage="npc9.ogg"]
お茶でも飲んでいきませんか？[wait time=3000][cm]
[anon_dlg]
#
[playse storage="nare35.ogg"]
何やらおばあさんは鏡に向かって一人で話し始めました。[wait time=7000][cm]
[playse storage="nare36.ogg"]
どうやらおばあさんは鏡に映った自分と話しているようです。[wait time=6000][cm]
[playse storage="nare37.ogg"]
あなたはどのように対応しますか？[wait time=4000][cm]



選択肢を選んでください。
[glink x="250" y="300" text="1:話を合わせる" target="*scn6_react1" exp="f.ans6 = 1"]
[glink x="650" y="300" text="2:鏡を隠す"  target="*scn6_react2" exp="f.ans6 = 0"]
[glink x="50" y="400" text="3:映っているのは自分だと説明する"  target="*scn6_react2" exp="f.ans6 = 0"]
[glink x="650" y="400" text="4:見守る" target="*scn6_react1" exp="f.ans6 = 1"]
[call target="*Sub_CountDown"]
@jump target="*scn2"

*scn6_react1
[timeroff]
[anon_dlg]
[chara_mod name="obasan" face="yorokobi"]
[playse storage="ans4-1.ogg"]
おばあさんは楽しい時間を過ごすことが出来ました。[wait time=5000][cm]
[eval exp="f.situnin3 = 1"]
[chara_hide name=obasan]
@jump target="*scn7"


*scn6_react2
[timeroff]
[chara_hide name=obasan]
[anon_dlg]
[playse storage="ans4-2.ogg"]
おばあさんはほかの部屋にある鏡に向かって話し始めました・・・[wait time=6000][cm]
[eval exp="f.situnin3 = 1"]
@jump target="*scn7"

;着衣---------------------------------------------------------------
*scn7
[bg storage=ribingu.jpg time=10][cm]
[chara_show name="obasan" top=50]
[named_dlg]
#player
・・・[wait time=2000][cm]
[playse storage="play3.ogg"]
これからおばあさんに洋服を着替えてもらうのだけど・・・[wait time=5000][cm]
[playse storage="play4.ogg"]
最近、洋服を着替えるのを嫌がるんだよなぁ。[wait time=5000][cm]
[anon_dlg]
#
[playse storage="nare18.ogg"]
あなたはおばあさんに洋服を着替えてもらいたいと考えています。[wait time=6000][cm]
[playse storage="nare19.ogg"]
しかし、最近おばあさんは洋服を着替えるのを嫌がるようになりました。[wait time=7000][cm]
[playse storage="nare20.ogg"]
おばあさんに声をかけて着替えてもらいましょう。[wait time=5000][cm]



選択肢を選んでください。
[glink x="100" y="300" text="1:こっちのほうが似合いますよ" target="*scn7_u1" exp="f.ans7 = 1"]
[glink x="650" y="300" text="2:脱いでください" target="*scn7_u2" exp="f.ans7 = 0"]
[glink x="100" y="400" text="3:これに着替えてください" target="*scn7_u3" exp="f.ans7 = 0"]
[glink x="650" y="400" text="4:お孫さんからのプレゼントですよ" target="*scn7_u4" exp="f.ans7 = 1"]
[call target="*Sub_CountDown"]
@jump target="*scn7_react2"

*scn7_u1
[timeroff]
#player
[playse storage="ans7-1.ogg"]
こっちのほうが似合いますよ[wait time=3000][cm]
@jump target="*scn7_react1"

*scn7_u2
[timeroff]
#player
[playse storage="ans7-2.ogg"]
脱いでください[wait time=2000][cm]
@jump target="*scn7_react2"

*scn7_u3
[timeroff]
#player
[playse storage="ans7-3.ogg"]
これに着替えてください[wait time=3000][cm]
@jump target="*scn7_react2"

*scn7_u4
[timeroff]
#player
[playse storage="ans7-4.ogg"]
お孫さんからのプレゼントですよ[wait time=5000][cm]
@jump target="*scn7_react1"

*scn7_react1
[named_dlg]
[chara_mod name="obasan" face="seikou"]
#obasan
[playse storage="npc2.ogg"]
そうね。[r]
それじゃあ、その服に着替えようかしら。[wait time=5000][cm]
[chara_hide name=obasan]
[eval exp="f.sikkou2 = 1"]
@jump target="*scn8"

*scn7_react2
[timeroff]
[named_dlg]
[chara_mod name="obasan" face="ikari"]
#obasan
[playse storage="npc3.ogg"]
絶対に嫌よ！[wait time=2000][cm]
[chara_hide name=obasan]
[eval exp="f.sikkou2 = 1"]
@jump target="*scn8"

;感情のコントロールができない---------------------------------------------------------------
*scn8
[bg storage=ribingu.jpg time=10][cm]
[chara_show name="obasan" top=50]
[chara_mod name="obasan" face="komari"]
[named_dlg]
#obasan
[playse storage="npc19.ogg"]
うーん・・・[wait time=2000][cm]
[playse storage="npc20.ogg"]
上手く着替えられないわね・・・[wait time=3000][cm]
[anon_dlg]
#
[playse storage="nare72.ogg"]
どうやらおばあさんは着替えをしようとしているようです。[wait time=6000][cm]
[named_dlg]
#player
[playse storage="play10.ogg"]
着替え手伝いましょうか？[wait time=3000][cm]
[chara_mod name="obasan" face="ikari"]
#obasan
!?[wait time=1000][cm]
[playse storage="npc21.ogg"]
やめなさいよ！？[wait time=3000][cm]
[playse storage="npc22.ogg"]
私に触らないで！！[wait time=3000][cm]
[anon_dlg]
#
[playse storage="nare73.ogg"]
あなたが着替えの手伝いを申し出たら、おばあさんが突然暴れだしてしまいました。[wait time=7000][cm]
[playse storage="nare37.ogg"]
あなたはどのように対応しますか？[wait time=4000][cm]



選択肢を選んでください。
[glink x="250" y="300" text="1:その場を離れる"  target="*scn8_react1" exp="f.ans8 = 1"]
[glink x="650" y="300" text="2:注意する"  target="*scn8_react2" exp="f.ans8 = 0"]
[glink x="250" y="400" text="3:押さえる"  target="*scn8_react2" exp="f.ans8 = 0"]
[glink x="650" y="400" text="4:落ち着くまで待つ"  target="*scn8_react1" exp="f.ans8 = 1"]
[call target="*Sub_CountDown"]
@jump target="*scn8_react2"

*scn8_react1
[timeroff]
[anon_dlg]
[chara_mod name="obasan" face="seikou"]
#
[playse storage="nare74.ogg"]
しばらくしたらおばあさんは落ち着いたようです。[wait time=5000][cm]
[eval exp="f.ninnti1 = 1"]
[chara_hide name=obasan]
@jump target="*scn9"

*scn8_react2
[timeroff]
[anon_dlg]
[chara_mod name="obasan" face="ikari"]
#
[playse storage="nare75.ogg"]
あなたはおばあさんに暴力を振るわれてケガをしてしまいました・・・[wait time=6000][cm]
[eval exp="f.ninnti1 = 1"]
[chara_hide name=obasan]
@jump target="*scn9"

;家族(親しい人)がわからなくなる---------------------------------------------------------------
*scn9
[bg storage=genkan.jpg time=10][cm]
[chara_show name="obasan" top=50]
[anon_dlg]
#
[playse storage="nare42.ogg"]
今、あなたは買い物を終えて帰宅したところです。[wait time=5000][cm]
[named_dlg]
#obasan
[playse storage="npc10.ogg"]
あら、久しぶりに会いましたね。[r]
お茶でもどうですか？[wait time=5000][cm]
[anon_dlg]
#
[playse storage="nare43.ogg"]
どうやら、おばあさんはあなたのことを友人だと勘違いしているようです。[wait time=7000][cm]
[playse storage="nare44.ogg"]
あなたはおばあさんにどの様な声を掛けますか？[wait time=5000][cm]



選択肢を選んでください。
[glink x="200" y="300" text="1:どうしたんですか？"  target="*scn9_u1" exp="f.ans9 = 0"]
[glink x="650" y="300" text="2:お久しぶりですね"  target="*scn9_u2" exp="f.ans9 = 1"]
[glink x="150" y="400" text="3:私はあなたの家族ですよ"  target="*scn9_u3" exp="f.ans9 = 0"]
[glink x="650" y="400" text="4:お茶にしましょう"  target="*scn9_u4" exp="f.ans9 = 1"]
[call target="*Sub_CountDown"]
@jump target="*scn9_react2"

*scn9_u1
[timeroff]
#player
[playse storage="ans13-1.ogg"]
どうしたんですか？[wait time=2000][cm]
@jump target="*scn9_react2"

*scn9_u2
[timeroff]
#player
[playse storage="ans13-2.ogg"]
お久しぶりですね[wait time=2000][cm]
@jump target="*scn9_react1"

*scn9_u3
[timeroff]
#player
[playse storage="ans13-3.ogg"]
私はあなたの家族ですよ[wait time=3000][cm]
@jump target="*scn9_react2"

*scn9_u4
[timeroff]
#player
[playse storage="ans13-4.ogg"]
お茶にしましょう[wait time=2000][cm]
@jump target="*scn9_react1"

*scn9_react1
[anon_dlg]
#
[chara_mod name="obasan" face="seikou"]
[playse storage="nare45.ogg"]
しばらくすると、おばあさんはあなたのことを思い出してくれたようです。[wait time=7000][cm]
[eval exp="f.kentousiki2 = 1"]
[chara_hide name=obasan]
@jump target="*scn10"

*scn9_react2
[timeroff]
#
[anon_dlg]
[chara_mod name="obasan" face="komari"]
[playse storage="nare46.ogg"]
おばあさんは警戒心を強めてしまいました。[wait time=5000][cm]
[eval exp="f.kentousiki2 = 1"]
[chara_hide name=obasan]
@jump target="*scn10"

;夕方に「家に帰る」と言い出す---------------------------------------------------------------
*scn10
[bg storage=ribingu.jpg time=10][cm]
[chara_show name="obasan" top=50]
[anon_dlg]
#
[playse storage="nare53.ogg"]
あなたは夕食の準備をしています。[r][wait time=4000]
[playse storage="nare54.ogg"]
すると・・・[wait time=2000][cm]
[named_dlg]
#obasan
[playse storage="npc11.ogg"]
「私、自分の家に帰りますね」[wait time=4000][cm]
[anon_dlg]
#
[playse storage="nare55.ogg"]
おばあさんが突然「家に帰る」と言い出しました[wait time=5000][cm]
[playse storage="nare39.ogg"]
おばあさんに声をかけましょう。[wait time=3000][cm]



選択肢を選んでください。
[glink x="100" y="300" text="1:食事を食べていってください"  target="*scn10_u1" exp="f.ans10 = 1"]
[glink x="650" y="300" text="2:ここが家ですよ"  target="*scn10_u2" exp="f.ans10 = 0"]
[glink x="200" y="400" text="3:どこに行くのですか"  target="*scn10_u3" exp="f.ans10 = 0"]
[glink x="650" y="400" text="4:送りますよ"  target="*scn10_u4" exp="f.ans10 = 1"]
[call target="*Sub_CountDown"]
@jump target="*scn10_react2"

*scn10_u1
[timeroff]
#player
[playse storage="ans15-1.ogg"]
食事を食べていってください[wait time=3000][cm]
@jump target="*scn10_react1"

*scn10_u2
[timeroff]
#player
[playse storage="ans15-2.ogg"]
ここが家ですよ[wait time=2000][cm]
@jump target="*scn10_react2"

*scn10_u3
[timeroff]
#player
[playse storage="ans15-3.ogg"]
どこに行くのですか[wait time=3000][cm]
@jump target="*scn10_react2"

*scn10_u4
[timeroff]
#player
[playse storage="ans15-4.ogg"]
送りますよ[wait time=2000][cm]
@jump target="*scn10_react1"

*scn10_react1
#
[anon_dlg]
[chara_mod name="obasan" face="seikou"]
[playse storage="nare56.ogg"]
おばあさんは落ち着いたようです。[wait time=3000][cm]
[eval exp="f.kentousiki4 = 1"]
[chara_hide name=obasan]
@jump target="*scn11"

*scn10_react2
[timeroff]
#
[anon_dlg]
[chara_mod name="obasan" face="zutuu"]
[playse storage="nare57.ogg"]
おばあさんはストレスが溜まってしまいました。[wait time=4000][cm]
[eval exp="f.kentousiki4 = 1"]
[chara_hide name=obasan]
@jump target="*scn11"

;物盗られ妄想---------------------------------------------------------------
*scn11
[bg storage=ribingu.jpg time=10][cm]
[chara_show name="obasan" top=50]
[named_dlg]
[chara_mod name="obasan" face="komari"]
#obasan
・・・[wait time=2000][cm]
[anon_dlg]
#
[playse storage="nare58.ogg"]
おばあさんは何かを探しているようです。[wait time=4000][cm]
[named_dlg]
#player
[playse storage="play8.ogg"]
どうしたの？[wait time=2000][cm]
[chara_mod name="obasan" face="ikari"]
#obasan
[playse storage="npc12.ogg"]
あなた、私の財布を盗んだでしょう！[wait time=4000][cm]
[anon_dlg]
#
[playse storage="nare59.ogg"]
どうやらおばあさんは財布をどこに入れたのか忘れて[r]
あなたを犯人扱いしています。[wait time=9000][cm]

[anon_dlg]
[playse storage="nare63.ogg"]
#
あなたは財布がおばあさんの部屋の引き出しにあることを[r]
知っています。おばあさんに財布を見つけてもらうには[r]
どんな行動をしますか？[wait time=12000][cm]



選択肢を選んでください。
[glink x="100" y="300" text="1:財布を見えるところに置く"  target="*scn11_react1" exp="f.ans11 = 1"]
[glink x="650" y="300" text="2:おばあさんを引き出しの方に連れていく" target="*scn11_react1" exp="f.ans11 = 1"]
[glink x="250" y="400" text="3:見つけて渡す" target="*scn11_react2" exp="f.ans11 = 0"]
[glink x="650" y="400" text="4:ある場所を教える"  target="*scn11_react2" exp="f.ans11 = 0"]
[call target="*Sub_CountDown"]
@jump target="*scn11_react2"

*scn11_react1
[timeroff]
[chara_mod name="obasan" face="yorokobi"]
[playse storage="nare64.ogg"]
無事おばあさんは財布を見つけることが出来たようです。
[wait time=5000][cm]
[eval exp="f.kioku1 = 1"]
[chara_hide name=obasan]
@jump target="*scn11_react2"

*scn11_react2
[timeroff]
[chara_mod name="obasan" face="ikari"]
[playse storage="nare62.ogg"]
おばあさんはあなたが財布を盗んだ犯人だと思ったままどこかに行ってしまいました・・・
[wait time=8000][cm]
[eval exp="f.kioku1 = 1"]
[chara_hide name=obasan]
@jump target="*scn12"

;収集癖---------------------------------------------------------------
*scn12
[bg storage=ribingu.jpg time=10][cm]
[chara_show name="obasan" top=50]
[named_dlg]
#player
[playse storage="play11.ogg"]
あれ？まただわ[wait time=3000][cm]
[playse storage="play12.ogg"]
タンスに使った後のティッシュがしまってある・・・[wait time=4000][cm]
[anon_dlg]
#
[playse storage="nare76.ogg"]
最近、おばあさんはタンスに使用済みのトイレットペーパーやティッシュを集めるようになりました。[wait time=9000][cm]
[playse storage="nare77.ogg"]
このような場合あなたならどのような声を掛けますか？[wait time=6000][cm]



選択肢を選んでください。
[glink x="80" y="300" text="1:ゴミを拾ってこないでください"  target="*scn12_u1" exp="f.ans12 = 0"]
[glink x="650" y="300" text="2:たくさん集めましたね"  target="*scn12_u2" exp="f.ans12 = 1"]
[glink x="250" y="400" text="3:これはゴミですよ"  target="*scn12_u3" exp="f.ans12 = 0"]
[glink x="650" y="400" text="4:大切な物なのですか？"  target="*scn12_u4" exp="f.ans12 = 1"]
[wait time="1000"]
[call target="*Sub_CountDown"]
@jump target="*scn12_react2"

*scn12_u1
[timeroff]
#player
[playse storage="ans17-1.ogg"]
ゴミを拾ってこないでください[wait time=3000][cm]
@jump target="*scn6"

*scn12_u2
[timeroff]
#player
[playse storage="ans17-2.ogg"]
たくさん集めましたね[wait time=3000][cm]
@jump target="*scn5"

*scn12_u3
[timeroff]
#player
[playse storage="ans17-3.ogg"]
これはゴミですよ[wait time=2000][cm]
@jump target="*scn6"

*scn12_u4
[timeroff]
#player
[playse storage="ans17-4.ogg"]
大切な物なのですか？[wait time=4000][cm]
@jump target="*scn5"

*scn12_react1
[timeroff]
[chara_mod name="obasan" face="yorokobi"]
#obasan
[playse storage="npc23.ogg"]
そうなのよ！[wait time=2000][cm]
[playse storage="npc24.ogg"]
これからトイレットペーパーやティッシュが手に入れづらくなるって聞いたから貯めているのよ。[wait time=7000][cm]
[anon_dlg]
#
[playse storage="nare78.ogg"]
どうやらおばあさんは若い頃の記憶を思いだしてティッシュなどを集めていたようです。[wait time=8000][cm]
[playse storage="nare79.ogg"]
おばあさんを傷つけることなく収集の理由を確認することができました。[wait time=7000][cm]
[eval exp="f.ninnti2 = 1"]
[chara_hide name=obasan]
@jump target="*scn13"

*scn12_react2
[timeroff]
[chara_mod name="obasan" face="ikari"]
[named_dlg]
#obasan
[playse storage="npc25.ogg"]
捨てちゃダメよ！[wait time=2000][cm]
[playse storage="npc26.ogg"]
大切な物なのだから！[wait time=3000][cm]
[anon_dlg]
#
[playse storage="nare80.ogg"]
おばあさんは怒り始めてしまいました。[wait time=4000][cm]
[chara_hide name=obasan]
[eval exp="f.ninnti2 = 1"]
@jump target="*scn13"


;幻視---------------------------------------------------------------
*scn13
[bg storage=ribingu.jpg time=10][cm]
[chara_show name="obasan" top=50]
[chara_mod name="obasan" face="komari"]
[named_dlg]
[playse storage="npc27.ogg"]
#obasan
あそこにいる人は誰？知らない人だわ・・・[wait time=5000][cm]
[anon_dlg]
#
[playse storage="nare81.ogg"]
おばあさんはハンガーにかかっている服を指で指して「知らない人がいる」と言い出しました.[wait time=8000][cm]
[playse storage="nare82.ogg"]
どうやらおばあさんにはハンガーにかかっている服が人に見えているようです。[wait time=7000][cm]
[playse storage="nare83.ogg"]
あなたならどのように声を掛けますか？[wait time=4000][cm]



選択肢を選んでください。
[glink x="250" y="300" text="1:誰もいないですよ"  target="*scn13_u1" exp="f.ans13 = 0"]
[glink x="650" y="300" text="2:おかしなこと言わないでください"  target="*scn13_u2" exp="f.ans13 = 0"]
[glink x="220" y="400" text="3:もう帰られましたよ"  target="*scn13_u3" exp="f.ans13 = 1"]
[glink x="650" y="400" text="4:さっき宅配便の人が来ていたよ"  target="*scn13_u4" exp="f.ans13 = 1"]
[wait time="1000"]
[call target="*Sub_CountDown"]
@jump target="*scn13_react2"

*scn13_u1
[timeroff]
#player
[playse storage="ans18-1.ogg"]
誰もいないですよ[wait time=2000][cm]
@jump target="*scn13_react2"

*scn13_u2
[timeroff]
#player
[playse storage="ans18-2.ogg"]
おかしなこと言わないでください[wait time=3000][cm]
@jump target="*scn13_react2"

*scn13_u3
[timeroff]
#player
[playse storage="ans18-3.ogg"]
もう帰られましたよ[wait time=3000][cm]
@jump target="*scn13_react1"

*scn13_u4
[timeroff]
#player
[playse storage="ans18-4.ogg"]
さっき宅配便の人が来ていたよ[wait time=4000][cm]
@jump target="*scn13_react1"

*scn13_react1
[timeroff]
[chara_mod name="obasan" face="seikou"]
#obasan
[playse storage="npc28.ogg"]
あら？そうなの？[wait time=3000][cm]
[playse storage="npc29.ogg"]
ならよかったわ。[wait time=2000][cm]
[anon_dlg]
#
[playse storage="nare84.ogg"]
どうやらおばあさんは落ち着いたようです。[wait time=4000][cm]
[eval exp="f.ninnti3 = 1"]
[chara_hide name=obasan]
@jump storage="ninnti.ks" target="*scn14"

*scn13_react2
[timeroff]
[position layer=message0 width=800 height=300 top=550 left=250 ]
[position layer=message0 page=fore frame="frame.png" margint="15" marginl="10" marginr="30" marginb="10"]
[chara_mod name="obasan" face="zutuu"]
#
[playse storage="nare85.ogg"]
どうやらおばあさんは、あなたのことを「この人は自分のことを信じてくれない人だ」と思ってしまったようです・・・[wait time=10000][cm]
[eval exp="f.ninnti3 = 1"]
[chara_hide name=obasan]
@jump storage="ninnti.ks" target="*scn14"


;排泄の失敗を繰り返す---------------------------------------------------------------
*scn14
[bg storage=ribingu.jpg time=10][cm]
[chara_show name="obasan" top=50]
[named_dlg]
#player
[playse storage="play6.ogg"]
あれ？床が濡れている？[wait time=4000][cm]
[playse storage="play7.ogg"]
（この匂いは・・・また、おばあさんがトイレに失敗してしまったのね。）[wait time=6000][cm]
[anon_dlg]
#
[playse storage="nare38.ogg"]
どうやら、おばあさんは排泄に失敗してしまったようです。
[wait time=6000][cm]
[playse storage="nare39.ogg"]
おばあさんに声をかけましょう。[wait time=3000][cm]



選択肢を選んでください。
[glink x="100" y="300" text="1:ここはトイレじゃないですよ"  target="*scn14_u1" exp="f.ans14 = 0"]
[glink x="650" y="300" text="2:着替えましょうか"  target="*scn14_u2" exp="f.ans14 = 1"]
[glink x="10" y="400" text="3:誰が掃除すると思っているのですか"  target="*scn14_u3" exp="f.ans14 = 0"]
[glink x="650" y="400" text="4:大丈夫ですよ"  target="*scn14_u4" exp="f.ans14 = 1"]
[call target="*Sub_CountDown"]
@jump target="*scn14_react2"

*scn14_u1
[wait_cancel]
[cm]
[clearstack stack="call" ]
[playse storage="ans12-1.ogg"]
[named_dlg]
#player
ここはトイレじゃないですよ[wait time=3000][cm]
@jump target="*scn14_react2"

*scn14_u2
[wait_cancel]
[cm]
[clearstack stack="call" ]
[playse storage="ans12-2.ogg"]
[named_dlg]
#player
着替えましょうか[wait time=2000][cm]
@jump target="*scn14_react1"

*scn14_u3
[wait_cancel]
[cm]
[clearstack stack="call" ]
[playse storage="ans12-3.ogg"]
[named_dlg]
#player
誰が掃除すると思っているのですか[wait time=4000][cm]
@jump target="*scn14_react2"

*scn14_u4
[wait_cancel]
[cm]
[clearstack stack="call" ]
[playse storage="ans12-4.ogg"]
[named_dlg]
#player
大丈夫ですよ[wait time=2000][cm]
@jump target="*scn14_react1"

*scn14_react1
[timeroff]
[anon_dlg]
[chara_mod name="obasan" face="seikou"]
#
[playse storage="nare40.ogg"]
おばあさんにストレスを与えることなく後処理をすることが出来ました。[wait time=6000][cm]
[eval exp="f.kentousiki1 = 1"]
[chara_hide name=obasan]
@jump target="*scn15"

*scn14_react2
[timeroff]
[anon_dlg]
[chara_mod name="obasan" face="naki"]
#
[playse storage="nare41.ogg"]
おばあさんは傷ついてしまいました・・・[wait time=5000][cm]
[eval exp="f.kentousiki1 = 1"]
[chara_hide name=obasan]
@jump target="*scn15"

;夜中に騒ぐ---------------------------------------------------------------
*scn15
[bg storage=yoru.jpg time=10][cm]
[chara_show name="obasan" top=50]
[chara_mod name="obasan" face="ikari"]
[anon_dlg]
#
[playse storage="nare47.ogg"]
何やらおばあさんが騒いでいるようです。[wait time=4000][cm]
[playse storage="nare48.ogg"]
どうやら昼夜の区別ができずに、一人でいることに孤独感を感じてしまっているようです。[wait time=8000][cm]
[playse storage="nare49.ogg"]
声をかけて落ち着いてもらいましょう。[wait time=4000][cm]



選択肢を選んでください。
[glink x="100" y="300" text="1:何時だと思っているのですか"  target="*scn15_u1" exp="f.ans15 = 0"]
[glink x="650" y="300" text="2:もう寝てください"  target="*scn15_u2" exp="f.ans15 = 0"]
[glink x="250" y="400" text="3:一緒に寝ましょう"  target="*scn15_u3" exp="f.ans15 = 1"]
[glink x="650" y="400" text="4:明日また話しましょう"  target="*scn15_u4" exp="f.ans15 = 1"]
[call target="*Sub_CountDown"]
@jump target="*scn15_react2"

*scn15_u1
[timeroff]
#player
[playse storage="ans14-1.ogg"]
何時だと思っているのですか[wait time=3000][cm]
@jump target="*scn15_react2"

*scn15_u2
[timeroff]
#player
[playse storage="ans14-2.ogg"]
もう寝てください[wait time=2000][cm]
@jump target="*scn15_react2"

*scn15_u3
[timeroff]
#player
[playse storage="ans14-3.ogg"]
一緒に寝ましょう[wait time=2000][cm]
@jump target="*scn15_react1"

*scn15_u4
[timeroff]
#player
[playse storage="ans14-4.ogg"]
明日また話しましょう[wait time=3000][cm]
@jump target="*scn15_react1"

*scn15_react1
#
[call target="*anon_dlg]"
[chara_mod name="obasan" face="seikou"]
[wait time=3000]
[chara_hide name=obasan]
[playse storage="nare50.ogg"]
おばあさんは落ち着いたので再び眠りにつきました。[wait time=5000][cm]
[eval exp="f.kentousiki3 = 1"]
@jump storage="fb.ks" target="*fb"

*scn15_react2
[call target="*timeroff]"
#
[call target="*anon_dlg]"
[chara_mod name="obasan" face="ikari"]
[playse storage="nare51.ogg"]
おばあさんは落ち着くことがなく、なかなか眠りにつきませんでした。[wait time=6000][cm]
[playse storage="nare52.ogg"]
あなたは睡眠不足になってしまいました・・・[wait time=4000][cm]
[eval exp="f.kentousiki3 = 1"]
[chara_hide name=obasan]
@jump storage="fb.ks" target="*fb"





;-----------------------------------------------------------
*Sub_CountDown
;-----------------------------------------------------------

[eval exp="f.time = 340"]
; 5秒カウントダウンしてからリターンする、サブルーチンラベルです。

; [keyframe]～[endkeyframe]
; 拡縮するキーフレームアニメーション。
[keyframe name="kanim_timer"]
  [frame p="  0%"]
  [frame p=" 40%"]
[endkeyframe]

; [image]
; 吹き出し画像を出します。
[image name="timer" storage="color/white.png" layer="0" left="450" top="50" width="348" height="38"]
[image name="timer" storage="color/black.png" layer="0" left="454" top="54" width="340" height="30"]
[image name="timer,timer_image" storage="color/col1.png" layer="0" left="454" top="54" width="340" height="30"]


; [ptext]
; 吹き出し画像の上に文字を出します。
[ptext name="timer" layer="0" text="制限時間" size="30"  x="300" y="45" color="0x000000" bold="bold" edge="0x000000"]

; [wait]
; 文字を出す処理と画像を出す処理の完了を確実に待つため、1ミリ秒待ちます。
[wait  time="1"]

; [kanim]
; 1ループあたり長さ1秒で、永久にループするキーフレームアニメーションを適用します。
[kanim name="timer" time="1000" keyframe="kanim_timer" count="infinite"]

; [wait][ptext]×4
; 1秒待つ→ptextでテキストを書き換えることを繰り返します。
; name="timer_text" overwrite="true" に着目してください！
; これを指定することで、新規のptextオブジェクトの作成を行わず、
;「既存のptextオブジェクトの内容の書き換え」が行えます。
[wait time="1000"]
[free layer="0" name="timer_image"]
[eval exp ="f.time = 306"]
[image overwrite="true" name="timer_image" storage="color/col1.png" layer="0" left="454" top="54" width="& f.time" height="30"]
[wait time="1000"]
[free layer="0" name="timer_image"]
[eval exp ="f.time = 272"]
[image overwrite="true" name="timer_image" storage="color/col1.png" layer="0" left="454" top="54" width="& f.time" height="30"]
[wait time="1000"]
[free layer="0" name="timer_image"]
[eval exp ="f.time = 238"]
[image overwrite="true" name="timer_image" storage="color/col1.png" layer="0" left="454" top="54" width="& f.time" height="30"]
[wait time="1000"]
[free layer="0" name="timer_image"]
[eval exp ="f.time = 204"]
[image overwrite="true" name="timer_image" storage="color/col1.png" layer="0" left="454" top="54" width="& f.time" height="30"]
[chara_mod name="obasan" face="naki"]
[wait time="1000"]
[free layer="0" name="timer_image"]
[eval exp ="f.time = 170"]
[image overwrite="true" name="timer_image" storage="color/col1.png" layer="0" left="454" top="54" width="& f.time" height="30"]
[wait time="1000"]
[free layer="0" name="timer_image"]
[eval exp ="f.time = 136"]
[image overwrite="true" name="timer_image" storage="color/col1.png" layer="0" left="454" top="54" width="& f.time" height="30"]
[wait time="1000"]
[free layer="0" name="timer_image"]
[eval exp ="f.time = 102"]
[image overwrite="true" name="timer_image" storage="color/red.png" layer="0" left="454" top="54" width="& f.time" height="30"]
[chara_mod name="obasan" face="zutuu"]
[wait time="1000"]
[free layer="0" name="timer_image"]
[eval exp ="f.time = 68"]
[image overwrite="true" name="timer_image" storage="color/red.png" layer="0" left="454" top="54" width="& f.time" height="30"]
[wait time="1000"]
[free layer="0" name="timer_image"]
[eval exp ="f.time = 34"]
[image overwrite="true" name="timer_image" storage="color/red.png" layer="0" left="454" top="54" width="& f.time" height="30"]
[wait time="1000"]
[free layer="0" name="timer_image"]
[eval exp ="f.time = 0"]
[image overwrite="true" name="timer_image" storage="color/red.png" layer="0" left="454" top="54" width="& f.time" height="30"]


; [free]
; 5秒待ちましたので、[image][ptext]で出した画像とテキストを削除します。
[free layer="0" name="timer"]
[free layer="0" name="timer_image"]

[return]