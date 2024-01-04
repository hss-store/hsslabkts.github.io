*op
[cm]
[anon_dlg]
[bg storage="ribingu_hiru.jpg" time="3000"]

[wait time="10"]
[playse storage="n_2.wav"]
あなたは認知症を患うおばあさんと一緒に暮らしています。[wait time="4000"][cm]
[playse storage="n_3.wav"]
あなたにとっておばあさんは母親という設定です。[wait time="3000"][cm]
[playse storage="n_4.wav"]
おばあさんと上手くコミュニケーションを取り合い、落ち着いて１日を過ごしましょう。[wait time="5000"][cm]
[playse storage="n_5.wav"]
朝です。[wait time="1000"][cm]

[chara_show name="obasan" top=50]
[playse storage="n_6.wav"]
おばあさんが起きてきたようです。[wait time="2000"][cm]

[ptext name="chara_name_area" layer="message0" width="200" color="white" x="280" y="540" size="26"]
[chara_config ptext="chara_name_area"]
[named_dlg]
#obasan
[playse storage="n_7.wav"]
おはよう。[wait time="1000"][cm]

[anon_dlg]
[playse storage="n_8.wav"]
挨拶を返しましょう。[wait time="2000"][cm]
[playse storage="n_9.wav"]
これからテキストボックスに文字を入力して、おばあさんに返事をしましょう。[wait time="5000"][cm]
[playse storage="n_10.wav"]
テキストボックスには念のため個人情報などを入力しないようにご注意ください。[wait time="5000"][cm]
※上部のテキストボックスをクリックして、「おはよう」と入力し、ボタンを押しましょう。
[edit name="f.test" color="0x000000" top="400" left="100" width="400"]
[button x="540" y="400" width="300" graphic="input.png" target="*ohayou"]
[s]

*ohayou
[commit]
[cm]
[named_dlg]
#player
[emb exp="f.test"][r]
※クリックして進みます。[l][cm]

[anon_dlg]
[playse storage="n_11.wav"]
おばあさんに挨拶はできましたか？[wait time="4000"][cm]
[playse storage="n_12.wav"]
では、早速開始していきます！[wait time="4000"][cm]

@jump storage="scenario.ks" target="*start1"