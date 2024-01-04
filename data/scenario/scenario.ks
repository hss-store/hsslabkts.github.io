*start1
[wait_cancel]

;朝食---------------------------------------------------------------
*scn1
[chara_show name="obasan" top="50"]
[anon_dlg]

問題１[wait time="3000"][cm]
[playse storage="n_13.wav"]
食事の時間です。[wait time="3000"][cm]
[playse storage="n_14.wav"]
おばあさんと食事をしましょう。[wait time="3000"][cm]
[playse storage="n_15.wav"]
おばあさんが食卓にやってきたようです。[wait time="3000"][cm]
[named_dlg]
#player
[playse storage="n_16.wav"]
おばあさん、そろそろ食事にしよう！[wait time="4000"][cm]
[chara_mod name="obasan" face="komari" time="2000"]
#obasan
・・・[wait time="3000"][cm]
[anon_dlg]
[playse storage="n_17.wav"]
おばあさんはなかなか食事を始めません。[wait time="4000"][cm]
[playse storage="n_18.wav"]
いったい、どうしたのでしょうか？[wait time="4000"][cm]

おばあさんに朝ごはんを食べてもらうための声かけを考えてみましょう。

[eval exp="f.sno = 1"]
[call storage="openaiapi.ks" target="*keityou"]

[named_dlg]
#player
[playse storage="n_19.wav"]
これは朝ごはんだよ![wait time="4000"][r]
[playse storage="n_20.wav"]
玉子焼き好きでしょう？お味噌汁も美味しいよ。[wait time="5000"][cm]

[chara_mod name="obasan" face="seikou" time="1600"]
[wait time="1600"]

[anon_dlg]
[playse storage="n_21.wav"]
おばあさんは朝ごはんだと分かり食べ始めることができました。[wait time="6000"][cm]
[chara_hide name="obasan" time="10"]
@jump target="*scn2"


;歯磨き---------------------------------------------------------------
*scn2
[cm]
[wait_cancel]
[clearstack]
[chara_hide name="obasan" time="3000"]
[bg storage="senmen.jpg" time="1000"]
[chara_show name="obasan" top="50"]
[anon_dlg]

問題２[wait time="3000"][cm]
[playse storage="n_22.wav"]
食事がとれたので歯磨きをしましょう。[wait time="4000"][cm]

[chara_mod name="obasan" face="komari"]
[playse storage="n_22a.wav"]
おばあさんに歯磨きをしてもらおうとしても口を開けてくれません。[wait time="5000"][cm]

おばあさんに歯磨きをしてもらうための声かけを考えてみましょう。
[eval exp="f.sno = 2"]
[call storage="openaiapi.ks" target="*keityou"]
[playse storage="n_23.wav"]
どうやら歯磨きを忘れてしまい、歯を磨くことが怖かったようです。[wait time="5500"][cm]

[named_dlg]
[playse storage="n_24.wav"]
これは歯を磨く歯ブラシだよ、口の中を綺麗にしようか。[wait time="5000"][cm]
[chara_mod name="obasan" face="seikou"]
[anon_dlg]
[playse storage="n_25.wav"]
おばあさんは歯磨きを始めました。[wait time="4000"][cm]

[chara_hide name="obasan" time="3000"]
[playse storage="n_26.wav"]
おばあさんは、朝ごはんや歯磨きが分からなかったようです。[wait time="4000"][cm]
[playse storage="n_27.wav"]
認知症には、失認という症状があり[wait time="3400"][cm]
[playse storage="n_28.wav"]
物が見えているのにも関わらず認識できなくなることがあります。[wait time="6000"][cm]
[playse storage="n_29.wav"]
おばあさんはご飯を食べるものだと分からなくて困ってしまったり[wait time="5000"][cm]
[playse storage="n_30.wav"]
歯磨きに恐怖を感じてしまったりしたようですね。[wait time="6000"][cm]

@jump target="*scn3"

;同じことを何度も言う---------------------------------------------------------------
/*
*scn3
[cm]
[wait_cancel]
[clearstack]
[bg storage="ribingu_hiru.jpg" time="10"]
[chara_show name="obasan" top=50]
[anon_dlg]

問題３[wait time="3000"][cm]
[named_dlg]
#obasan
[playse storage="n_31.wav"]
ねぇ、お米を注文しておいてくれる？[wait time="5000"][cm]
#player
[playse storage="n_32.wav"]
注文しておくよ。[wait time="3000"][cm]
[anon_dlg]

数時間後・・・[wait time="4000"][cm]
[named_dlg]
#obasan
[playse storage="n_31.wav"]
ねぇ、お米を注文しておいてくれる？[wait time="4500"][cm]
[anon_dlg]
[playse storage="n_33.wav"]
なぜか同じ話を何度もされてしまいます。[wait time="4000"][cm]

何度も同じ話をする理由は何か考えて、声かけしましょう。

[eval exp="f.sno = 3"]
[call storage="openaiapi.ks" target="*keityou"]

[playse storage="n_34.wav"]
おばあさんはお米がなくなったら大変だと不安になっていたようです。[wait time="5000"][cm]

[anon_dlg]
[playse storage="n_35.wav"]
お米の注文がいつ届くかメモ書きを置きました。[wait time="4000"][cm]
[chara_mod name="obasan" face="seikou"]
[playse storage="n_36.wav"]
すると、おばあさんは安心したようです。[wait time="7000"][cm]

[chara_hide name="obasan" time="3000"]
[playse storage="n_48.wav"]
認知症が原因で記憶障害が起こることがよくあります。[wait time="5000"][cm]
[playse storage="n_49.wav"]
その場合、忘れたことを責めるのではなく、[wait time="3000"][cm]
[playse storage="n_50.wav"]
なぜ何度も確認しているのかを考えて[wait time="3000"]
[playse storage="n_51.wav"]
不安を取り除くようにすることが大事ですね。[wait time="7000"][cm]
[chara_hide name="obasan" time="10"]
@jump target="*scn5"

*/



;家族(親しい人)がわからなくなる---------------------------------------------------------------
*scn3
[cm]
[wait_cancel]
[clearstack]
[bg storage="genkan_hiru.jpg" time="10"]
[chara_show name="obasan" top="50"]
[anon_dlg]
問題３[wait time="3000"][cm]
[playse storage="n_52.wav"]
今、あなたは買い物を終えて帰宅したところです。[wait time="5000"][cm]

[named_dlg]
#obasan
[playse storage="n_53.wav"]
あら、久しぶりに会いましたね。[wait time="3000"][r]
[playse storage="n_54.wav"]
お茶でもどうですか？[wait time="5000"][cm]

[anon_dlg]


こんなとき、あなたならどうしますか？声かけを考えてみましょう

[eval exp="f.sno = 5"]
[call storage="openaiapi.ks" target="*keityou"]

[anon_dlg]
[playse storage="n_55.wav"]
あなたのことを昔の友人だと思い込んでしまったようです。[wait time="5000"][cm]

[named_dlg]
#player
[playse storage="n_56.wav"]
お茶をいただきましょうか。[wait time="3000"][cm]

[chara_mod name="obasan" face="seikou" time="3000"]
[anon_dlg]
[playse storage="n_57.wav"]
おばあさんはお茶を飲んでいるうちに[r]
あなたのことを思い出したようです。[wait time="7000"][cm]

[chara_hide name="obasan" time="10"]
@jump target="*scn6"

;夕方に「家に帰る」と言い出す---------------------------------------------------------------
*scn6
[cm]
[wait_cancel]
[clearstack]
[bg storage="ribingu_yu.jpg" time="200"][cm]
[chara_show name="obasan" top="50"]
[anon_dlg]
問題４[wait time="3000"]
[playse storage="n_58.wav"]
あなたは夕食の準備をしています。[wait time="4000"][cm]
[playse storage="n_59.wav"]
すると・・・[wait time=3000][cm]
[named_dlg]
#obasan
[playse storage="n_60.wav"]
私、自分の家に帰りますね。[wait time="5000"][cm]
[anon_dlg]


こんなとき、あなたならどうしますか？声かけを考えてみましょう

[eval exp="f.sno = 6"]
[call storage="openaiapi.ks" target="*keityou"]
[chara_mod name="obasan" face="komari"]
[anon_dlg]
[playse storage="n_61.wav"]
どうやら、おばあさんは今がいつか分からなくなり、[wait time="5000"][cm]
[playse storage="n_62.wav"]
昔の記憶の自分に戻ってしまったようです。[wait time="4000"][cm]

[named_dlg]
#player
[playse storage="n_63.wav"]
（もしかしたら、ここが自分の家でないと思い込んでいるのかも）[wait time="4000"][cm]
[playse storage="n_64.wav"]
（少し散歩をしておばあさんの気を紛らわせてみましょうか。）[wait time="5000"][cm]

[playse storage="n_65.wav"]
おばあさん、では一緒に帰ろうか。[wait time="4000"][cm]

[chara_mod name="obasan" face="seikou" time="3000"]
[anon_dlg]
[playse storage="n_66.wav"]
おばあさんは出かける支度をし始めました。[wait time="5000"][cm]
[chara_hide name="obasan" time="10"]
@jump target="*scn7"




;着衣---------------------------------------------------------------
*scn7
[cm]
[wait_cancel]
[clearstack]
[bg storage="ribingu_yu.jpg" time="200"]
[chara_hide name="obasan"]
問題５[wait time="3000"][cm]
[named_dlg]
#player
[playse storage="n_67.wav"]
（少し散歩をして、おばあさんの気を紛らわせてみましょうか。）[wait time="6000"][cm]
[chara_show name="obasan" top="50" time="1000"]
[playse storage="n_68.wav"]
#obasan
準備できたわ。[wait time="3000"][cm]

[anon_dlg]
[playse storage="n_69.wav"]
おばあさんは薄着で外に出ようとしています。[wait time="4000"][cm]

[named_dlg]
#player
[playse storage="n_70.wav"]
部屋の中は暖かいけれど、[wait time="1700"][r]
[playse storage="n_71.wav"]
今は冬なのにそんな恰好では風邪ひくよ。[wait time="4000"][cm]

[chara_mod name="obasan" face="ikari" time="1000"]
#obasan
[playse storage="n_72.wav"]
私は暑がりだからほっといて[wait time="4000"][cm]

[anon_dlg]


どうしたら厚着をしてくれるでしょうか？厚着を着てもらうための声かけを考えてみましょう。

[eval exp="f.sno = 7"]
[call storage="openaiapi.ks" target="*keityou"]

[chara_mod name="obasan" face="ge"]
[anon_dlg]
[playse storage="n_73.wav"]
おばあさんは、外が寒いことが分からなかったようです。[wait time="5000"]

[named_dlg]
#player
[playse storage="n_74.wav"]
一度外に出てみようか。[wait time="2200"][cm]

[bg storage="genkan_yu.jpg" time="1000"][cm]
[wait time="1000"]
[chara_mod name="obasan" face="naki"]
[playse storage="n_75.wav"]
#obasan
やっぱり服を着ようかしら？[wait time="3000"][cm]

#player
[playse storage="n_76.wav"]
その方が良いと思うよ。[wait time="3000"][cm]

[chara_mod name="obasan" face="seikou" time="1000"]
[anon_dlg]
[playse storage="n_77.wav"]
おばあさんは厚着をして出かけました。[wait time="4000"][cm]
[playse storage="n_78.wav"]
少し散歩をすると、おばあさんは自分の家を思い出しました。[wait time="5000"][cm]



[chara_hide name="obasan" time="3000"]
[playse storage="n_79.wav"]
見当識障害という「季節」「時間」「場所」など把握できなくなることがあります。[wait time="7000"][cm]
[playse storage="n_80.wav"]
見当識障害が原因で、記憶が混乱してしまうことがありますが[wait time="5000"][cm]
[playse storage="n_81.wav"]
混乱を否定し説得することは難しいことです。[wait time="4000"][cm]
[playse storage="n_82.wav"]
話を合わせつつ、気分転換を促したり、安心させたりすることが重要です。[wait time="6000"][cm]
[chara_hide name="obasan" time="10"]
@jump target="*scn8"





;鏡に映った自分に話しかける---------------------------------------------------------------
*scn8
[cm]
[wait_cancel]
[clearstack]
[bg storage="ribingu_yu.jpg" time="1000"][cm]
[chara_show name="obasan" top="50"]
問題６[wait time="3000"][cm]
[named_dlg]
[chara_mod name="obasan" face="yorokobi"]
#obasan
・・・！[wait time="2000"][r]
[playse storage="n_83.wav"]
あら、久しぶりに会いましたね。[wait time="3400"][cm]
[playse storage="n_84.wav"]
お茶でも飲んでいきませんか？[wait time="5000"][cm]
[anon_dlg]
[playse storage="n_85.wav"]
何やらおばあさんは鏡に向かって一人で話し始めました。[wait time="5000"][cm]

こんなとき、あなたならどうしますか？声かけを考えてみましょう。

[eval exp="f.sno = 8"]
[call storage="openaiapi.ks" target="*keityou"]

[chara_mod name="obasan" face="yorokobi"]
[anon_dlg]
[playse storage="n_86.wav"]
どうやら、鏡に映った自身の姿を[wait time="3000"][r]
[playse storage="n_87.wav"]
友人だと思い込んでいるようです。[wait time="5000"][cm]

[named_dlg]
#player
[playse storage="n_88.wav"]
楽しそうに話しているね。[wait time="2000"][r]
[playse storage="n_89.wav"]
彼女は誰なの？[wait time="4000"][cm]
[chara_mod name="obasan" face="seikou" time="1000"]
[wait time="1000"]
[anon_dlg]
[playse storage="n_90.wav"]
おばあさんは楽しそうに話始めました。[wait time="4000"][cm]

[chara_hide name="obasan" time="3000"]
[playse storage="n_91.wav"]
認知症が原因で幻覚が見えることがあります。[wait time="4000"][cm]
[playse storage="n_92.wav"]
患者の視点では実際に見えているものなので否定するのは難しいです。[wait time="6000"][cm]
[playse storage="n_93.wav"]
今回の場合、他者から見ると奇妙に感じるかもしれませんが、[wait time="5000"][cm]
[playse storage="n_94.wav"]
患者が楽しそうにしているので対処は不要だと考えられます。[wait time="5000"][cm]
[playse storage="n_95.wav"]
幻視が抑制するには、鏡を隠すなど幻視が起こりにくい環境を作ることが大切です。[wait time="7000"][cm]

@jump target="*scn9"




;物盗られ妄想---------------------------------------------------------------
*scn9
[cm]
[wait_cancel]
[clearstack]
[bg storage="ribingu_yu.jpg" time="1000"][cm]
[chara_show name="obasan" top=50]
問題７[wait time="3000"][cm]
[named_dlg]
[chara_mod name="obasan" face="komari"]
#obasan
・・・[wait time="3400"][cm]
[anon_dlg]
[playse storage="n_96.wav"]
おばあさんは何かを探しているようです。[wait time="4000"][cm]
[named_dlg]
#player
[playse storage="n_97.wav"]
どうしたの？[wait time="2000"][cm]
[chara_mod name="obasan" face="ikari"]
#obasan
[playse storage="n_98.wav"]
あなた、私の財布を盗んだでしょう！[wait time="5000"][cm]
[anon_dlg]
[playse storage="n_99.wav"]
どうやらおばあさんは財布をどこに入れたのか忘れてあなたを犯人扱いしています。[wait time="6000"][cm]

[named_dlg]
[playse storage="n_100.wav"]
（そういえば、財布は机の上にあった気がするな）[wait time="4000"][cm]

[anon_dlg]


財布を見つけてもらうにはどうしたら良いでしょうか。声かけを考えてみましょう。

[eval exp="f.sno = 9"]
[call storage="openaiapi.ks" target="*keityou"]

[chara_mod name="obasan" face="ikari"]
[anon_dlg]
[playse storage="n_101.wav"]
うまくおばあさんを財布の見えるところに誘導しました。[wait time="4000"][cm]

[chara_mod name="obasan" face="seikou"]
[named_dlg]
#obasan
[playse storage="n_102.wav"]
あったわ！[wait time="2000"][cm]

[anon_dlg]
[playse storage="n_103.wav"]
おばあさんは安心したようです。[wait time="4000"][cm]
[chara_hide name="obasan" time="10"]
@jump target="*scn10"

;異食---------------------------------------------------------------
*scn10
[cm]
[wait_cancel]
[clearstack]
[bg storage="ribingu_yu.jpg" time="10"][cm]
[chara_show name="obasan" top="50"]
問題８[wait time="3000"][cm]
[anon_dlg]
[playse storage="n_104.wav"]
おばあさんは、テーブルの上に落ちていた植物の葉っぱを口に入れてしまいました。[wait time="6000"][cm]



どうしたら葉っぱを食べるのを止めてもらえるでしょうか？声かけを考えてみましょう。

[eval exp="f.sno = 10"]
[call storage="openaiapi.ks" target="*keityou"]

[chara_mod name="obasan" face="ge"]
[named_dlg]
#player
[playse storage="n_105.wav"]
ビスケットがあるから、こっちを食べようか。[wait time="4000"][cm]

[chara_mod name="obasan" face="seikou" time="1000"]
[anon_dlg]
[playse storage="n_106.wav"]
おばあさんは葉っぱを食べるのを止めてビスケットを食べ始めました。[wait time="5000"][cm]


[chara_hide name="obasan" time="3000"]
[playse storage="n_107.wav"]
認知症が原因で、食べ物でない物を食べてしまう異食を起こすことがあります。[wait time="6000"][cm]
[playse storage="n_108.wav"]
様子を見て驚くかもしれませんが患者は食べ物だと思い込んでいるため、[wait time="4000"][cm]
[playse storage="n_109.wav"]
無理に吐き出させるのは難しく、信頼を失う可能性もあります。[wait time="6000"][cm]
[playse storage="n_110.wav"]
今回は、口に入れて大きな危険があるものではないため、落ち着いて対応すると良いです。[wait time="6000"][cm]
[playse storage="n_111.wav"]
ただし、口に入れて危険なものについては、吐き出させるなどの処置を行う必要があります。[wait time="6000"][cm]
[playse storage="n_111.wav"]
今回は机の上に食事が並ぶことが多いため、机の上にあるものは食品という[wait time="6000"][cm]
[playse storage="n_113.wav"]
誤認を起こしやすい環境でした。[wait time="3000"][cm]
[playse storage="n_114.wav"]
異食を防ぐためには環境を整えることも重要です。[wait time="7000"][cm]
[chara_hide name="obasan" time="10"]
@jump storage="fb.ks" target="*response_fb1"
[s]

;食事をしたことを忘れる---------------------------------------------------------------
/*
*scn4
[cm]
[wait_cancel]
[clearstack]
[bg storage="ribingu_hiru.jpg" time="10"]
[chara_show name="obasan" top=50]
[anon_dlg]

問題４[wait time="3000"][cm]

[named_dlg]
[chara_mod name="obasan" face="komari"]
#obasan
[playse storage="n_37.wav"]
朝ごはんはまだかい？
[wait time="4000"][cm]
[chara_mod name="obasan" face="ikari"]
[wait time="1000"]
[playse storage="n_38.wav"]
朝ごはんはまだかい！
[wait time="3000"][cm]
[anon_dlg]
[playse storage="n_39.wav"]
先ほど朝食を食べたはずなのにどうしたのでしょうか？
[wait time="4000"][cm]

おばあさんに声をかけて理由を考えてみましょう。[wait time="3000"][cm]


[eval exp="f.sno = 4"]
[call storage="openaiapi.ks" target="*keityou"]
[chara_mod name="obasan" face="komari"]
[anon_dlg]
[playse storage="n_40.wav"]
どうやら朝食を食べたことを忘れて[wait time="3500"][cm]
[playse storage="n_41.wav"]
このまま朝食が食べられないのではかと不安になってしまったようです。[wait time="5000"][cm]
[chara_mod name="obasan" face="ikari"]
[named_dlg]
#obasan
[playse storage="n_42.wav"]
朝ごはんは無いのかい？[wait time="3000"][cm]
#player
[playse storage="n_43.wav"]
（おばあさんは朝食を食べていないと思い込んでいるから）[wait time="4000"][cm]
[playse storage="n_44.wav"]
（否定するのは難しいね）[wait time="4000"][cm]
[playse storage="n_45.wav"]
今準備しているから、ちょっと待ってね[wait time="4000"][cm]
[chara_mod name="obasan" face="seikou"]
[anon_dlg]
[wait time="1000"]
[playse storage="n_46.wav"]
軽食を用意したところ、おばあさんは満足したようです。[wait time="5000"][cm]
[named_dlg]
#player
[playse storage="n_47.wav"]
（次から、朝ごはんも軽めにしておくと良いかもしれないな。）[wait time="5000"][cm]



@jump target="*scn5"
*/