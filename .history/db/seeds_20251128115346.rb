# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# データをクリアする場合は以下を有効にしてください
# Choice.destroy_all
# Question.destroy_all

# encoding: utf-8

# ==============================================================================
# 1. 真偽値
# ==============================================================================
question1 = Question.create!(
  content: "Rubyにおける**真の値**として正しいものをすべて選んでください。(2つ選択)",
  explanation: "Rubyでは、**false**と**nil**のみが論理的に**偽**として扱われます。それ以外のすべてのオブジェクト（空文字列 \"\" や数値 0 を含む）は論理的に**真**として扱われます。したがって、**\"\"** (a) および **0** (b) が真の値です。",
  category: "条件分岐 / 真偽値"
)
question1.choices.create!([
  { content: "(a) \"\"", is_correct: true },
  { content: "(b) 0", is_correct: true },
  { content: "(c) false", is_correct: false },
  { content: "(d) nil", is_correct: false }
])

# ==============================================================================
# 2. 予約語
# ==============================================================================
question2 = Question.create!(
  content: "Rubyの**予約語**として正しいものをすべて選んでください。(2つ選択)",
  explanation: "Rubyの予約語は、言語の構造を定義するために使用されるキーワードです。`class`と`true`は予約語です。`each`や`rand`、`send`はメソッド名です。",
  category: "予約語 / キーワード"
)
question2.choices.create!([
  { content: "(a) each", is_correct: false },
  { content: "(b) rand", is_correct: false },
  { content: "(c) class", is_correct: true },
  { content: "(d) send", is_correct: false },
  { content: "(e) true", is_correct: true }
])

# ==============================================================================
# 3. 変数名
# ==============================================================================
question3 = Question.create!(
  content: "Rubyの**変数名**として正しいものを選んでください。(1つ選択)",
  explanation: "Rubyのローカル変数名は、**小文字またはアンダースコア**ではじまる必要があります。(a)は数字で始まるため不可。(b)は予約語なので不可。(e)は`$`が含まれているためローカル変数としては不可（`$`で始まるのはグローバル変数）。(c)の`_9class`はアンダースコアで始まり、英数字とアンダースコアのみで構成されているため正しいローカル変数名です。",
  category: "変数 / スコープ"
)
question3.choices.create!([
  { content: "(a) 3y", is_correct: false },
  { content: "(b) false", is_correct: false },
  { content: "(c) _9class", is_correct: true },
  { content: "(d) xyz$", is_correct: false } # 元の選択肢が(e)となっているため、順序を修正して(d)としています。
])

# ==============================================================================
# 4. 文字列の式展開
# ==============================================================================
question4 = Question.create!(
  content: "$code = \"CODE\"\n__(1)__\n\n[出力]\ni like writing CODE\n\n__(1)__に入る適切な記述を選択してください。(2つ選択)",
  explanation: "ダブルクォートの文字列リテラル内では、で式展開が可能です。グローバル変数（`$code`）の場合、`#{$code}`だけでなく、省略記法として`#$code`も使用できます。シングルクォートでは式展開は行われません。",
  category: "String / 式展開"
)
question4.choices.create!([
  { content: "(a) puts \"i like writing #{$code}\"", is_correct: true },
  { content: "(b) puts \"i like writing #$code\"", is_correct: true },
  { content: "(c) puts 'i like writing #{$code}'", is_correct: false },
  { content: "(d) puts 'i like writing #$code'", is_correct: false }
])

# ==============================================================================
# 5. 整数リテラル（8進数）
# ==============================================================================
question5 = Question.create!(
  content: "num = 025\nputs num\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "整数リテラルの**先頭の0**は**8進数**表記を意味します。8進数の25は、10進数で $2 \\times 8^1 + 5 \\times 8^0 = 16 + 5 = 21$ となります。出力はデフォルトで10進数で行われます。",
  category: "整数リテラル / 数値表現"
)
question5.choices.create!([
  { content: "(a) nil", is_correct: false },
  { content: "(b) 025", is_correct: false },
  { content: "(c) 21", is_correct: true },
  { content: "(d) 25", is_correct: false }
])

# ==============================================================================
# 6. 三項演算子
# ==============================================================================
question6 = Question.create!(
  content: "以下のコードがあります。\nx = \"Hello\"\ny = x.empty? ? 1 : 2\np y\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "三項演算子 `cond ? expr1 : expr2` は、`cond`が真なら`expr1`を、偽なら`expr2`を返します。`x.empty?` は \"Hello\" が空ではないため **false** を返します。したがって、`y`には **2** が代入されます。",
  category: "条件分岐 / 三項演算子"
)
question6.choices.create!([
  { content: "(a) 1", is_correct: false },
  { content: "(b) 2", is_correct: true },
  { content: "(c) \"Hello\"", is_correct: false },
  { content: "(d) true", is_correct: false }
])

# ==============================================================================
# 7. case文とRange
# ==============================================================================
question7 = Question.create!(
  content: "以下のコードがあります。\namount = 120\n\nsize = case amount\n  when 1..120; \"S\"\n  when 120..170; \"M\"\n  when 170..200; \"L\"\n  else \"XL\"\nend\n\np size\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "case文はwhenの条件にマッチする**最初の分岐**を実行します。Rubyの範囲リテラル `x..y` は、**yの値を含みます**。`amount`は120なので、最初の `when 1..120`（1以上120以下）がマッチし、`size`には **\"S\"** が代入されます。",
  category: "case文 / Range"
)
question7.choices.create!([
  { content: "(a) \"S\"", is_correct: true },
  { content: "(b) \"M\"", is_correct: false },
  { content: "(c) \"L\"", is_correct: false },
  { content: "(d) \"XL\"", is_correct: false }
])

# ==============================================================================
# 8. ブロックスコープとローカル変数
# ==============================================================================
question8 = Question.create!(
  content: "以下のコードがあります。\nitem = \"apple\"\n\n[\"banana\", \"carrot\", \"daikon\"].each do |item|\n  puts item\nend\n\nputs item\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "ブロックのパラメータ（`|item|`）は、外側のスコープのローカル変数名と同じであっても、ブロック内では**ブロックローカル変数**として扱われ、外側のローカル変数をシャドウ（隠蔽）します。ブロック内ではブロックローカルな`item`が出力され、ブロックを抜けた後の`puts item`では外側のローカル変数`item`の値（\"apple\"）が出力されます。",
  category: "ブロック / スコープ"
)
question8.choices.create!([
  { content: "(a) 文法エラーが発生する", is_correct: false },
  { content: "(b) 例外が発生する", is_correct: false },
  { content: "(c)\nbanana\ncarrot\ndaikon\ndaikon", is_correct: false },
  { content: "(d)\nbanana\ncarrot\ndaikon\napple", is_correct: true }
])

# ==============================================================================
# 9. Integer#timesとクロージャ
# ==============================================================================
question9 = Question.create!(
  content: "以下のコードがあります。\nx = 0\n\n4.times do |i|\n  x += i\nend\n\np x\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "`Integer#times`メソッドは、0から指定された値の直前の整数（この場合は0, 1, 2, 3）までをブロックパラメータ`i`に渡しながらブロックを実行します。ブロック内の`x += i`は、外側のローカル変数`x`を変更します。$x = 0 + 0 + 1 + 2 + 3 = 6$ となります。",
  category: "ブロック / ループ"
)
question9.choices.create!([
  { content: "(a) 0", is_correct: false },
  { content: "(b) 4", is_correct: false },
  { content: "(c) 6", is_correct: true },
  { content: "(d) 文法エラーが発生する", is_correct: false }
])

# ==============================================================================
# 10. String#each_charとEnumerable#map
# ==============================================================================
question10 = Question.create!(
  content: "以下のコードがあります。\ns = \"abcde\"\np s.each_char.map { |i|\n  i * 2\n}\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "`String#each_char`は1文字ずつの文字列（\"a\", \"b\", ...）をyieldします。`Enumerable#map`はブロックの評価結果の配列を返します。`string * integer`は文字列をinteger回繰り返した文字列を返すため、`i * 2`は各文字を2回繰り返します。",
  category: "String / Enumerable"
)
question10.choices.create!([
  { content: "(a) [97, 98, 99, 100, 101]", is_correct: false },
  { content: "(b) [194, 196, 198, 200, 202]", is_correct: false },
  { content: "(c) [\"a\", \"b\", \"c\", \"d\", \"e\"]", is_correct: false },
  { content: "(d) [\"aa\", \"bb\", \"cc\", \"dd\", \"ee\"]", is_correct: true },
  { content: "(e) 実行時にエラーになる", is_correct: false }
])

# ==============================================================================
# 11. String#charsとEnumerable#tally
# ==============================================================================
question11 = Question.create!(
  content: "以下のコードがあります。\np \"cocoa\".chars.tally\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "`String#chars`は1文字ずつの文字列の配列 `[\"c\", \"o\", \"c\", \"o\", \"a\"]` を返します。`Enumerable#tally`は要素の出現回数を集計したハッシュを返します。",
  category: "String / Enumerable / Hash"
)
question11.choices.create!([
  { content: "(a) {99=>2, 111=>2, 97=>1}", is_correct: false },
  { content: "(b) {?c=>2, ?o=>2, ?a=>1}", is_correct: false },
  { content: "(c) {\"c\"=>2, \"o\"=>2, \"a\"=>1}", is_correct: true },
  { content: "(d) 実行時にエラーになる", is_correct: false }
])

# ==============================================================================
# 12. 文字列の置換
# ==============================================================================
question12 = Question.create!(
  content: "以下の実行結果を出力するコードがあります。 __(1)__に入る適切な記述を選択してください。(1つ選択)\n\nputs \"blah blah blah\".__(1)__(/blah/, \"yay\")\n\n[出力]\nyay yay yay",
  explanation: "元の文字列の**全て**のパターンマッチング箇所を置換するには`String#gsub`を使用します。`String#sub`は最初にマッチした部分のみを置換します。",
  category: "String（置換）"
)
question12.choices.create!([
  { content: "(a) sub", is_correct: false },
  { content: "(b) gsub", is_correct: true },
  { content: "(c) replace", is_correct: false },
  { content: "(d) replace_all", is_correct: false }
])

# ==============================================================================
# 13. if/elsif/else
# ==============================================================================
question13 = Question.create!(
  content: "以下のコードがあります。\ns = \"pear\"\n\nif s.empty?\n  puts \"blank\"\nelsif s.length < 5\n  puts \"short\"\nelse\n  puts \"long\"\nend\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "`s`は\"pear\"で、`s.empty?`はfalseです。`s.length`は4で、`s.length < 5`は**true**です。`elsif`が最初に条件を満たしたため、**\"short\"** が出力されます。",
  category: "String / 条件分岐"
)
question13.choices.create!([
  { content: "(a) blank", is_correct: false },
  { content: "(b) short", is_correct: true },
  { content: "(c) long", is_correct: false },
  { content: "(d) 例外が発生する", is_correct: false }
])

# ==============================================================================
# 14. String#sliceと安全ナビゲーション演算子
# ==============================================================================
question14 = Question.create!(
  content: "以下のコードがあります。\n\n[\"foo: abc\", \"bar: 100\"].each do |i|\n  p i.slice(/[0-9]+/)&\.to_i\nend\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "`String#slice`は正規表現にマッチした部分文字列を返しますが、マッチしない場合は**nil**を返します。最初の要素(\"foo: abc\")ではマッチせず**nil**が返ります。安全ナビゲーション演算子 `&.` は、レシーバがnilの場合、メソッド呼び出しを行わず**nil**を返します。2番目の要素(\"bar: 100\")では\"100\"が返り、`.to_i`が呼ばれて100が出力されます。",
  category: "String / 安全ナビゲーション演算子"
)
question14.choices.create!([
  { content: "(a)\n0\n100", is_correct: false },
  { content: "(b)\nnil\n100", is_correct: true },
  { content: "(c)\nfalse\n100", is_correct: false },
  { content: "(d) 文法エラーが発生する", is_correct: false },
  { content: "(e) 実行時にエラーになる", is_correct: false }
])

# ==============================================================================
# 15. キーワード引数とデフォルト値
# ==============================================================================
question15 = Question.create!(
  content: "以下のコードがあります。\n\ndef foo(x: 1, y: 2, z: 3)\n  p [x, y, z]\nend\n\nfoo(y: 4, z: 5)\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "キーワード引数が与えられなかった引数(`x:`)にはデフォルト値が使用され、与えられた引数(`y:`, `z:`)にはその値が使用されます。結果は `[1, 4, 5]` となります。",
  category: "メソッド定義"
)
question15.choices.create!([
  { content: "(a) [1, 2, 3]", is_correct: false },
  { content: "(b) [1, 4, 5]", is_correct: true },
  { content: "(c) 文法エラーが発生する", is_correct: false },
  { content: "(d) 実行時にエラーになる", is_correct: false }
])

# ==============================================================================
# 16. ハッシュのキーワード展開
# ==============================================================================
question16 = Question.create!(
  content: "以下の実行結果を出力するコードがあります。 __(1)__に入る適切な記述を選択してください。(1つ選択)\n\ndef foo(x:, y:, z:)\n  p [x, y, z]\nend\n\nh = {x: 1, y: 2, z: 3}\n__(1)__\n[出力]\n[1, 2, 3]",
  explanation: "ハッシュをキーワード引数として展開してメソッドに渡すには、`**`演算子を使用します。",
  category: "メソッド（キーワード展開）"
)
question16.choices.create!([
  { content: "(a) foo(*h)", is_correct: false },
  { content: "(b) foo(**h)", is_correct: true },
  { content: "(c) foo(&h)", is_correct: false },
  { content: "(d) foo(^h)", is_correct: false }
])

# ==============================================================================
# 17. 正規表現のアンカーと選択
# ==============================================================================
question17 = Question.create!(
  content: "\"Ruby\"または\"ruby\"のいずれかの文字列**のみ**にマッチする正規表現をすべて選択してください。(2つ選択)",
  explanation: "`\A`アンカーは文字列の先頭に、`\z`アンカーは文字列の末尾にマッチし、文字列全体にマッチすることを強制します。`[...]`は文字クラスで、ブラケット内のいずれかの文字にマッチします。(a)と(c)は文字列全体が\"Ruby\"または\"ruby\"である場合にのみマッチします。(b)は`\ARuby`または`ruby\z`にマッチし、`Ruby123`や`123ruby`にもマッチしてしまいます。",
  category: "正規表現（Regex）"
)
question17.choices.create!([
  { content: "(a) /\\A[Rr]uby\\z/", is_correct: true },
  { content: "(b) /\\ARuby|ruby\\z/", is_correct: false },
  { content: "(c) /\\A[Rr][u][b][y]\\z/", is_correct: true },
  { content: "(d) /\\AR|ruby\\z/", is_correct: false }
])

# ==============================================================================
# 18. 定数の再代入
# ==============================================================================
question18 = Question.create!(
  content: "以下のコードがあります。\nMSG = 42\nMSG += 5\np MSG\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "Rubyの**定数**は再定義・再代入が可能ですが、これは通常望ましくないため、**警告**が表示されます。しかし、実行自体は行われ、`MSG`の値は47に更新されて出力されます。",
  category: "定数 / 変数"
)
question18.choices.create!([
  { content: "(a) 警告なしで47が表示される。", is_correct: false },
  { content: "(b) MSGは定数なのでエラーが発生する。", is_correct: false },
  { content: "(c) MSGは定数なので42が表示される。", is_correct: false },
  { content: "(d) MSGは定数なので警告が表示されるが、47が表示される。", is_correct: true }
])

# ==============================================================================
# 19. 定数とオブジェクトの破壊的操作
# ==============================================================================
question19 = Question.create!(
  content: "以下のコードがあります。\nMSG = \"hello\"\nMSG.upcase!\np MSG\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "定数`MSG`自体が指すオブジェクト（\"hello\"）は変わっていません。`upcase!`は**オブジェクトの内容を破壊的に変更**するメソッドです。定数そのものの再定義ではないため、警告は表示されず、変更された内容（\"HELLO\"）が出力されます。",
  category: "定数 / オブジェクトのミュータブル性"
)
question19.choices.create!([
  { content: "(a) MSGは定数なのでエラーが発生する。", is_correct: false },
  { content: "(b) 警告なしでHELLOが表示される。", is_correct: true },
  { content: "(c) MSGは定数なので警告が表示されるが、HELLOが表示される。", is_correct: false },
  { content: "(d) MSGは定数なのでhelloが表示される。", is_correct: false }
])

# ==============================================================================
# 20. 変数のスコープと記号
# ==============================================================================
question20 = Question.create!(
  content: "以下の説明のうち正しいものをすべて選択してください。(2つ選択)",
  explanation: "**グローバル変数**は`$`ではじまり、**定数**は**大文字**ではじまります。ローカル変数は小文字またはアンダースコアではじまります。インスタンス変数は`@`ではじまり、クラス変数は`@@`ではじまります。",
  category: "変数（スコープ・記号）"
)
question20.choices.create!([
  { content: "(a) ローカル変数は小文字ではじまり、2文字以上の長さである。", is_correct: false },
  { content: "(b) グローバル変数は$ではじまる。", is_correct: true },
  { content: "(c) インスタンス変数は*ではじまる。", is_correct: false },
  { content: "(d) クラス変数は$ではじまる。", is_correct: false },
  { content: "(e) 定数は大文字ではじまる。", is_correct: true }
])

# ==============================================================================
# 21. Arrayの破壊的操作
# ==============================================================================
question21 = Question.create!(
  content: "以下のコードがあります。\nx = [1,2,3,4,5,6,7,8]\ny = x\nx.reject! { |e| e.even? }\np x\np y\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "`y = x`によって、`x`と`y`は**同じ配列オブジェクト**を参照しています。`Array#reject!`はレシーバである配列を**破壊的に変更**するため、`x`を通して行われた変更は`y`からも参照されます。",
  category: "Array（破壊的操作）"
)
question21.choices.create!([
  { content: "(a)\n[1, 3, 5, 7]\n[1, 2, 3, 4, 5, 6, 7, 8]", is_correct: false },
  { content: "(b)\n[1, 2, 3, 4, 5, 6, 7, 8]\n[1, 2, 3, 4, 5, 6, 7, 8]", is_correct: false },
  { content: "(c)\n[1, 3, 5, 7]\n[1, 3, 5, 7]", is_correct: true },
  { content: "(d)\n[1, 3, 5, 7]\n[2, 4, 6, 8]", is_correct: false }
])

# ==============================================================================
# 22. Arrayの基本操作
# ==============================================================================
question22 = Question.create!(
  content: "以下のコードがあります。\na = [ 2, 4, 6, 8, 10 ]\na.shift\na.pop\na.push(12)\np a\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "`a.shift`で先頭の**2**が削除され、`[4, 6, 8, 10]`に。`a.pop`で末尾の**10**が削除され、`[4, 6, 8]`に。`a.push(12)`で末尾に**12**が追加され、`[4, 6, 8, 12]`となります。",
  category: "Array（基本操作）"
)
question22.choices.create!([
  { content: "(a) [2, 4, 6, 8, 10, 12]", is_correct: false },
  { content: "(b) [2, 4, 6, 8, 10]", is_correct: false },
  { content: "(c) [4, 6, 8, 12]", is_correct: true },
  { content: "(d) [4, 6, 8]", is_correct: false }
])

# ==============================================================================
# 23. 論理演算子の短絡評価
# ==============================================================================
question23 = Question.create!(
  content: "以下の実行結果を出力するコードがあります。 __(1)__に入る適切な記述を選択してください。(1つ選択)\n\nx = true\nx __(1)__ exit(1)\nputs(\"succeeded!\")\n\n[出力]\nsucceeded!",
  explanation: "`succeeded!`が出力されるためには、`exit(1)`が実行されない必要があります。論理演算子 `||` は、左辺が**真**の場合に右辺を**短絡評価**するため、`exit(1)`は実行されません。`x`は`true`なので、`||`が適切です。",
  category: "論理演算子"
)
question23.choices.create!([
  { content: "(a) |", is_correct: false },
  { content: "(b) ||", is_correct: true },
  { content: "(c) &", is_correct: false },
  { content: "(d) &&", is_correct: false }
])

# ==============================================================================
# 24. or演算子と変数スコープ
# ==============================================================================
question24 = Question.create!(
  content: "以下のコードがあります。\nm = true\nm or n = true\np n\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "演算子`or`は短絡評価され、`m`が`true`なので右辺の`n = true`は**実行されません**。しかし、Rubyのローカル変数は**静的に宣言**されるため、`n`という変数は存在します。初期化されていないローカル変数の値は**nil**です。",
  category: "演算子 / 変数スコープ"
)
question24.choices.create!([
  { content: "(a) true", is_correct: false },
  { content: "(b) false", is_correct: false },
  { content: "(c) nil", is_correct: true },
  { content: "(d) 文法エラーが発生する", is_correct: false }
])

# ==============================================================================
# 25. Arrayのスライス（インデックスと長さ、Range）
# ==============================================================================
question25 = Question.create!(
  content: "以下の実行結果を出力するコードがあります。 __(1)__に入る適切な記述を選択してください。(2つ選択)\n\nx = [ 9, 7, 5, 3, 1 ]\np __(1)__\n\n[出力]\n[7, 5, 3]",
  explanation: "配列`x`は`[9, 7, 5, 3, 1]`です。`[7, 5, 3]`はインデックス1から始まる長さ3の部分配列です。**x[1, 3]** は「インデックス1から長さ3」の部分配列を意味します。負のインデックスは末尾からの位置を示し、`-1`が末尾です。`7`は末尾から4番目(`x[-4]`)、`3`は末尾から2番目(`x[-2]`)なので、**x[-4..-2]** も正しいです。",
  category: "Array（スライス）"
)
question25.choices.create!([
  { content: "(a) x[1, 3]", is_correct: true },
  { content: "(b) x[1..-1]", is_correct: false },
  { content: "(c) x[-3..-1]", is_correct: false },
  { content: "(d) x[-4..-2]", is_correct: true }
])

# ==============================================================================
# 26. Arrayのフィルタリング
# ==============================================================================
question26 = Question.create!(
  content: "以下の実行結果を出力するコードがあります。 __(1)__に入る適切な記述を選択してください。(2つ選択)\n\nary = [ 1, 2, 3, 4, 5 ]\np ary.__(1)__ { |i| i.odd? }\n\n[出力]\n[1, 3, 5]",
  explanation: "与えられたブロックが**真**の値を返す要素を抽出した配列を返すのは、`Array#select`と、その別名である`Array#filter`です。",
  category: "Array / Enumerable"
)
question26.choices.create!([
  { content: "(a) collect", is_correct: false },
  { content: "(b) select", is_correct: true },
  { content: "(c) map", is_correct: false },
  { content: "(d) filter", is_correct: true },
  { content: "(e) filter_map", is_correct: false }
])

# ==============================================================================
# 27. Stringから数値への変換
# ==============================================================================
question27 = Question.create!(
  content: "以下のコードがあります。\nputs \"42A7\".to_i\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "`String#to_i`は文字列の先頭から整数として解析を試み、**数字ではない文字**(`A`)が現れるとそこで解析を終了します。デフォルトは10進数解析なので、**42**が出力されます。",
  category: "String → 数値変換"
)
question27.choices.create!([
  { content: "(a) 42", is_correct: true },
  { content: "(b) 42A7", is_correct: false },
  { content: "(c) 17063", is_correct: false },
  { content: "(d) 実行時にエラーになる", is_correct: false }
])

# ==============================================================================
# 28. Hashのキーの存在確認
# ==============================================================================
question28 = Question.create!(
  content: "次のメソッドのうち`:c`がハッシュのキーとして存在するかどうかを**「返さない」**ものを選択してください。(1つ選択)\n\nh = {a: 2, b: 4, c: 6, d: 8, e: 10}",
  explanation: "`has_key?`、`include?`、`key?`、`member?`はすべてHashのキーの存在を確認する同義のメソッドです。`Hash`に`contain?`メソッドは**存在しません**。",
  category: "Hash"
)
question28.choices.create!([
  { content: "(a) p h.has_key?(:c)", is_correct: false },
  { content: "(b) p h.contain?(:c)", is_correct: true },
  { content: "(c) p h.include?(:c)", is_correct: false },
  { content: "(d) p h.key?(:c)", is_correct: false },
  { content: "(e) p h.member?(:c)", is_correct: false }
])

# ==============================================================================
# 29. Arrayの破壊的フィルタリング
# ==============================================================================
question29 = Question.create!(
  content: "以下の実行結果を出力するコードがあります。 __(1)__に入る適切な記述を選択してください。(2つ選択)\n\na = [120, 40, 20, 80, 160, 60, 180]\na.__(1)__\np a\n\n[出力]\n[120, 80, 160, 180]",
  explanation: "元の配列からブロックが**真**を返す要素を**削除**し、配列を**破壊的に変更**するメソッドは、`Array#reject!`と`Array#delete_if`です。`i < 80`が真（40, 20, 60）の要素が削除されます。`delete_if!`というメソッドはありません。",
  category: "Array（破壊的フィルタ）"
)
question29.choices.create!([
  { content: "(a) reject! {|i| i < 80}", is_correct: true },
  { content: "(b) slice {|i| i < 80 }", is_correct: false },
  { content: "(c) slice! {|i| i < 80}", is_correct: false },
  { content: "(d) delete_if! {|i| i < 80}", is_correct: false },
  { content: "(e) delete_if {|i| i < 80}", is_correct: true },
  { content: "(f) reject {|i| i < 80}", is_correct: false }
])

# ==============================================================================
# 30. 配列の和集合
# ==============================================================================
question30 = Question.create!(
  content: "以下の実行結果を出力するコードがあります。 __(1)__に入る適切な記述を選択してください。(1つ選択)\n\np [\"apple\", \"banana\"] __(1)__ [\"banana\", \"carrot\"]\n\n[出力]\n[\"apple\", \"banana\", \"carrot\"]",
  explanation: "配列に対して演算子 **`|`** を使用すると、**和集合**（重複を除去して結合した新しい配列）が生成されます。`&`は積集合、`+`や`concat`は単純な連結です。",
  category: "配列の和集合"
)
question30.choices.create!([
  { content: "(a) .concat", is_correct: false },
  { content: "(b) &", is_correct: false },
  { content: "(c) |", is_correct: true },
  { content: "(d) ||", is_correct: false }
])

# ==============================================================================
# 31. %i記法（シンボルの配列）
# ==============================================================================
question31 = Question.create!(
  content: "以下のコードがあります。\np %i(x1 x2 x3)\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: " `%i(...)` は、空白で区切られた文字列からなる**シンボルの配列**を作成するリテラル記法です。式展開は行われません。",
  category: "シンボル / リテラル"
)
question31.choices.create!([
  { content: "(a) \"x1 x2 x3\"", is_correct: false },
  { content: "(b) [1, 2, 3]", is_correct: false },
  { content: "(c) [\"x1\", \"x2\", \"x3\"]", is_correct: false },
  { content: "(d) [:x1, :x2, :x3]", is_correct: true }
])

# ==============================================================================
# 32. 例外処理（継承）
# ==============================================================================
question32 = Question.create!(
  content: "以下のコードがあります。\nclass SomeError < StandardError; end\nclass SomeOtherError < SomeError; end\n\ndef meth1\n  raise SomeOtherError.new(\"error\")\nend\n\nbegin\n  meth1\nrescue SomeError\n  print \"SomeError\"\nrescue SomeOtherError\n  print \"SomeOtherError\"\nend\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "`SomeOtherError`は`SomeError`のサブクラスです。`begin/rescue/end`ブロックでは、発生した例外に**最初に該当した**`rescue`節が実行されます。`rescue SomeError`はサブクラスの例外も捕捉するため、こちらが先に実行され、`SomeOtherError`節は実行されません。",
  category: "例外処理"
)
question32.choices.create!([
  { content: "(a) A syntax error", is_correct: false },
  { content: "(b) SomeError", is_correct: true },
  { content: "(c) SomeErrorSomeOtherError", is_correct: false },
  { content: "(d) SomeOtherError", is_correct: false }
])

# ==============================================================================
# 33. 例外処理（ensure）
# ==============================================================================
question33 = Question.create!(
  content: "以下のコードがあります。\n\nbegin\n  ans = 100/0\n  puts ans\nrescue ZeroDivisionError\n  puts \"Error: ZeroDivisionError\"\n  exit 1\nensure\n  puts \"DONE!\"\nend\n\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "`100/0`で`ZeroDivisionError`が発生し、`rescue`節が実行され、エラーメッセージが出力されます。`exit 1`でプログラムは終了しますが、`ensure`節は**例外の有無や`exit`の呼び出しに関わらず**、ブロックの終了時に必ず実行されます。",
  category: "例外処理 / ensure"
)
question33.choices.create!([
  { content: "(a)\n0\nDONE!", is_correct: false },
  { content: "(b)\nError: ZeroDivisionError", is_correct: false },
  { content: "(c)\nError: ZeroDivisionError\nDONE!", is_correct: true },
  { content: "(d)\nError: ZeroDivisionError\n0", is_correct: false }
])

# ==============================================================================
# 34. クラスの継承（デフォルトスーパークラス）
# ==============================================================================
question34 = Question.create!(
  content: "クラスのスーパークラスを明示的に指定しなかった場合、以下のうち正しいものを選択してください。(1つ選択)",
  explanation: "Rubyにおいて、スーパークラスを明示的に指定しないクラスは、自動的に標準の**Objectクラス**を継承します。",
  category: "クラス / 継承"
)
question34.choices.create!([
  { content: "(a) 例外UndefinedParentClassErrorが発生する", is_correct: false },
  { content: "(b) 文法エラーが発生する", is_correct: false },
  { content: "(c) Moduleクラスがスーパークラスになる", is_correct: false },
  { content: "(d) スーパークラスのないクラスが作成される", is_correct: false },
  { content: "(e) Objectクラスがスーパークラスになる", is_correct: true }
])

# ==============================================================================
# 35. クラスの再オープンとObjectクラス
# ==============================================================================
question35 = Question.create!(
  content: "以下のコードがあります。\nclass Object\n  def moo\n    puts \"MOO!\"\n  end\nend\n\n\"Cow\".moo\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "Rubyでは、組み込みクラスを含むクラスを**再オープン**してメソッドを追加できます。ほとんどのオブジェクトは`Object`クラスを継承しているため、`Object`にメソッドを追加すると、すべてのオブジェクトでそのメソッドが利用可能になります。",
  category: "クラス / 再オープン"
)
question35.choices.create!([
  { content: "(a) 何も出力されない", is_correct: false },
  { content: "(b) 実行時にエラーになる", is_correct: false },
  { content: "(c) MOO!", is_correct: true },
  { content: "(d) nil", is_correct: false }
])

# ==============================================================================
# 36. クラスの初期化メソッド
# ==============================================================================
question36 = Question.create!(
  content: "以下の実行結果を出力するコードがあります。 __(1)__に入る適切な記述を選択してください。(1つ選択)\n\nclass Shouter\n  def __(1)__(message)\n    @message = message\n  end\n\n  def greet\n    puts @message.upcase\n  end\nend\n\ng = Shouter.new(\"Hello, world!\")\ng.greet\n\n[出力]\nHELLO, WORLD!",
  explanation: "クラスのインスタンスが生成される際（`Shouter.new`が呼ばれた後）に、初期化を行うために自動的に呼び出されるメソッドは**`initialize`**です。",
  category: "クラス / コンストラクタ"
)
question36.choices.create!([
  { content: "(a) Shouter", is_correct: false },
  { content: "(b) new", is_correct: false },
  { content: "(c) initialize", is_correct: true },
  { content: "(d) __init__", is_correct: false }
])

# ==============================================================================
# 37. クラスのインスタンス生成
# ==============================================================================
question37 = Question.create!(
  content: "以下の実行結果を出力するコードがあります。 __(1)__に入る適切な記述を選択してください。(1つ選択)\n\nclass Shouter\n  def initialize(message)\n    @message = message\n  end\n\n  def greet\n    puts @message.upcase\n  end\nend\n\ng = __(1__)__(\"Hello, world!\")\ng.greet\n\n[出力]\nHELLO, WORLD!",
  explanation: "Rubyでクラスの新しいインスタンスを生成するには、`クラス名.new`という形式を使用します。",
  category: "クラス / インスタンス生成"
)
question37.choices.create!([
  { content: "(a) Shouter", is_correct: false },
  { content: "(b) #Shouter", is_correct: false },
  { content: "(c) new Shouter", is_correct: false },
  { content: "(d) Shouter.new", is_correct: true }
])

# ==============================================================================
# 38. 継承とsuper
# ==============================================================================
question38 = Question.create!(
  content: "以下のコードがあります。\nclass Foo\n  attr_reader :var\n  def initialize\n    @var = \"apple\"\n  end\nend\n\nclass Bar < Foo\n  def initialize\n    @var = \"banana\"\n    super\n  end\nend\n\nbar = Bar.new\nputs bar.var\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "`Bar.new`が呼ばれ、`Bar#initialize`が実行されます。最初に`@var = \"banana\"`が代入されますが、その後の**`super`**によって**親クラスの同名メソッド**（`Foo#initialize`）が引数なしで呼び出されます。`Foo#initialize`内で`@var = \"apple\"`が実行され、これが**最終的な値**となります。",
  category: "継承 / メソッド呼び出し"
)
question38.choices.create!([
  { content: "(a) apple", is_correct: true },
  { content: "(b) banana", is_correct: false },
  { content: "(c) 何も出力されない", is_correct: false },
  { content: "(d) 実行時にエラーになる", is_correct: false }
])

# ==============================================================================
# 39. Stringの前方削除
# ==============================================================================
question39 = Question.create!(
  content: "以下の実行結果を出力するコードがあります。 __(1)__に入る適切な記述を選択してください。(1つ選択)\n\nputs \"$foo$\".__(1)__(\"$\")\n\n[出力]\nfoo$",
  explanation: "文字列の**先頭**から特定の文字列を削除した結果を返すのは**`String#delete_prefix`**です。`delete`は引数で指定された**すべての文字**を削除するため、.deleteは`\"foo\"`になります。",
  category: "String（前方削除）"
)
question39.choices.create!([
  { content: "(a) sub", is_correct: false },
  { content: "(b) chop", is_correct: false },
  { content: "(c) delete", is_correct: false },
  { content: "(d) delete_prefix", is_correct: true }
])

# ==============================================================================
# 40. RangeからArrayへの変換
# ==============================================================================
question40 = Question.create!(
  content: "以下の実行結果を出力するコードがあります。 __(1)__に入る適切な記述を選択してください。(1つ選択)\n\nr = \"a\"..\"e\"\np r.__(1)__\n\n[出力]\n[\"a\", \"b\", \"c\", \"d\", \"e\"]",
  explanation: "コレクションオブジェクトを配列に変換するために慣習的に使用されるメソッドは**`to_a`**です。`Range#to_a`は範囲内の要素を順序付けられた配列にして返します。",
  category: "Range → Array"
)
question40.choices.create!([
  { content: "(a) array", is_correct: false },
  { content: "(b) to_ary", is_correct: false },
  { content: "(c) to_a", is_correct: true },
  { content: "(d) to_array", is_correct: false }
])

# ==============================================================================
# 41. Enumerable#find
# ==============================================================================
question41 = Question.create!(
  content: "以下のコードがあります。\np [0,1,2,3,4,5].find {|x| x < 3}\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "`Enumerable#find`（または`#detect`）は、ブロックが**真**を返した**最初の要素**を返します。この場合、配列の最初の要素`0`で`0 < 3`が真となるため、`0`が返されます。",
  category: "Enumerable"
)
question41.choices.create!([
  { content: "(a) [0, 1, 2]", is_correct: false },
  { content: "(b) 0", is_correct: true },
  { content: "(c) [0, 1, 2, 3]", is_correct: false },
  { content: "(d) true", is_correct: false }
])

# ==============================================================================
# 42. Arrayのソート（降順）
# ==============================================================================
question42 = Question.create!(
  content: "以下の実行結果を出力するコードがあります。 __(1)__に入る適切な記述を選択してください。(2つ選択)\n\np [1,16,8,4,2].__(1)__\n\n[出力]\n[16, 8, 4, 2, 1]",
  explanation: "降順ソートを実現するには、(1)昇順ソート後に配列を反転させる **`sort.reverse`**、または(2)ソートの基準をブロックで逆転させる（例: 値の負の数でソートする） **`sort_by { |x| -x }`** が使用できます。",
  category: "Array / ソート"
)
question42.choices.create!([
  { content: "(a) sort_by { |x| -x }", is_correct: true },
  { content: "(b) sort_reverse", is_correct: false },
  { content: "(c) sort.reverse", is_correct: true },
  { content: "(d) reverse.sort", is_correct: false }
])

# ==============================================================================
# 43. Arrayのソート（ブロック比較）
# ==============================================================================
question43 = Question.create!(
  content: "配列を降順にソートするコードがあります。 __(1)__に入る適切な記述を選択してください。(1つ選択)\n\nary = [2,4,8,1,16]\np ary.__(1)__\n\n[出力]\n[16, 8, 4, 2, 1]",
  explanation: "`sort`メソッドに与えるブロックは、比較対象の2要素（`i`, `j`）を受け取り、`i`が`j`よりも「前」に来るべき場合は負の値、「後」に来るべき場合は正の値、順序が同じ場合は0を返す必要があります。降順にするには、**`i`と`j`を逆転して比較**します。`j <=> i` も降順になりますが、選択肢にはありません。`i <=> j` は昇順です。`i`と`j`に負の符号を付けて昇順比較を行う **`(-i) <=> (-j)`** は降順と同じ結果になります。",
  category: "Array / ソート"
)
question43.choices.create!([
  { content: "(a) sort { |i,j| -i <= -j }", is_correct: false },
  { content: "(b) sort { |i,j| -i <=> -j }", is_correct: true },
  { content: "(c) sort { |i,j| i >= j }", is_correct: false },
  { content: "(d) sort{ |i,j| i <=> j }", is_correct: false }
])

# ==============================================================================
# 44. Fileの操作（seekとgets）
# ==============================================================================
question44 = Question.create!(
  content: "以下のコードがあります。\nFile.write(\"test\", \"hellorubyworld\\n\")\nFile.open(\"test\") do |file|\n  file.seek(5)\n  print file.gets\nend\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "`File.write`によりファイル内容は `hellorubyworld\n` となります。`file.seek(5)`はファイルのポインタを**0から数えて5バイト目（5文字目）の次**に移動します。つまり、`hello`の直後の`r`の前に移動します。`file.gets`は現在の位置から行末までを読み込むため、**`rubyworld\n`**が出力されます（`print`なので改行込み）。",
  category: "IO / File"
)
question44.choices.create!([
  { content: "(a) hello", is_correct: false },
  { content: "(b) rubyworld", is_correct: true },
  { content: "(c) hellor", is_correct: false },
  { content: "(d) rubyw", is_correct: false },
  { content: "(e) orubyworld", is_correct: false }
])

# ==============================================================================
# 45. Fileのオープンモード（デフォルト）
# ==============================================================================
question45 = Question.create!(
  content: "以下のコードではopenメソッドの第2引数を省略してファイルを開いています。このケースで暗黙的に第2引数として指定されるものを選択してください。\n\nfile = open(\"sample.txt\")",
  explanation: "`open`メソッド（または`File.open`）でモードを省略した場合、デフォルトで**読み取り専用**モードの **\"r\"** が指定されます。",
  category: "IO / File"
)
question45.choices.create!([
  { content: "(a) r", is_correct: true },
  { content: "(b) r+", is_correct: false },
  { content: "(c) a", is_correct: false },
  { content: "(d) a+", is_correct: false },
  { content: "(e) w", is_correct: false },
  { content: "(f) w+", is_correct: false }
])

# ==============================================================================
# 46. Fileのオープンモード（上書き）
# ==============================================================================
question46 = Question.create!(
  content: "test_one.txtの内容をtest_two.txtにコピーするコードがあります。 __(1)__に入る適切な記述を選択してください。\n\ntest_two.txtがすでに存在する場合、このコードは最初にファイルサイズを0にし、先頭から内容を上書きするものとします。(2つ選択)\n\nopen(\"test_one.txt\") {|source|\n  open(\"test_two.txt\", \"__(1)__\") {|dest|\n    dest.write(source.read)\n  }\n}",
  explanation: "既存のファイルを**サイズ0に切り詰め**、**ファイルの先頭から書き込み**を行うモードは、**\"w\"**（書き込みのみ）と **\"w+\"**（読み書き可能）です。このコードでは`dest.write`しか行わないため、どちらも正解となります。",
  category: "IO / File"
)
question46.choices.create!([
  { content: "(a) r+", is_correct: false },
  { content: "(b) a", is_correct: false },
  { content: "(c) a+", is_correct: false },
  { content: "(d) w", is_correct: true },
  { content: "(e) w+", is_correct: true }
])

# ==============================================================================
# 47. Dirクラスに存在しないメソッド
# ==============================================================================
question47 = Question.create!(
  content: "Dirクラスに**存在しない**クラスメソッドを選択してください。(2つ選択)",
  explanation: "`Dir.pwd`（カレントディレクトリの取得）や`Dir.chdir`（カレントディレクトリの変更）、`Dir.delete`（ディレクトリの削除）は存在します。ファイルやディレクトリの**名前の変更**は`File.rename`または`FileUtils.mv`、**パスの末尾のファイル名**の取得は`File.basename`で行うため、`Dir.rename`と`Dir.basename`は存在しません。",
  category: "Dir / ファイル操作"
)
question47.choices.create!([
  { content: "(a) Dir.pwd", is_correct: false },
  { content: "(b) Dir.rename", is_correct: true },
  { content: "(c) Dir.basename", is_correct: true },
  { content: "(d) Dir.chdir", is_correct: false },
  { content: "(e) Dir.delete", is_correct: false }
])

# ==============================================================================
# 48. Stringの部分取得
# ==============================================================================
question48 = Question.create!(
  content: "以下のコードがあります。\np \"hello ruby world\"[6,4]\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "文字列のスライスは、`str[開始インデックス, 長さ]`の形式で行われます。インデックスは0から始まります。`h`が0文字目なので、6文字目(`r`)から長さ4の文字列（`ruby`）が取得されます。",
  category: "String（部分取得）"
)
question48.choices.create!([
  { content: "(a) \"hello \"", is_correct: false },
  { content: "(b) \"ruby\"", is_correct: true },
  { content: "(c) \" world\"", is_correct: false },
  { content: "(d) 実行時にエラーになる", is_correct: false }
])

# ==============================================================================
# 49. Stringの部分置換
# ==============================================================================
question49 = Question.create!(
  content: "以下のコードがあります。\nstr = \"bat\"\nstr[1,1] = \"o\"\np str\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "`str[1,1]`は「インデックス1から長さ1」、つまり`a`の部分文字列を指定しています。これに`\"o\"`が代入される（置換される）ため、`\"b\"` + `\"o\"` + `\"t\"` で **\"bot\"** となります。置換文字列の長さは元の部分文字列の長さと同じである必要はありません。",
  category: "String（部分置換）"
)
question49.choices.create!([
  { content: "(a) \"boo\"", is_correct: false },
  { content: "(b) \"bot\"", is_correct: true },
  { content: "(c) \"oat\"", is_correct: false },
  { content: "(d) \"o\"", is_correct: false }
])

# ==============================================================================
# 50. 演算子の定義
# ==============================================================================
question50 = Question.create!(
  content: "以下のコードがあります。\nputs 5 * \"hi\"\n実行結果として正しいものを選択してください。(1つ選択)",
  explanation: "Rubyの`*`演算子は、レシーバ（この場合は数値`5`）に定義されています。数値の`*`は、通常、引数も数値であることを期待します。`String`クラスは、`Fixnum * String`のような演算に対応するための`coerce`メソッドを定義していないため、**`TypeError`（実行時エラー）**が発生します。`\"hi\" * 5`（文字列に`*`が定義されている）であれば`\"hihihihihi\"`となります。",
  category: "演算子 / 数値 & 文字列"
)
question50.choices.create!([
  { content: "(a) \"hihihihihi\"", is_correct: false },
  { content: "(b) 実行時にエラーになる", is_correct: true },
  { content: "(c) \"5hi\"", is_correct: false },
  { content: "(d) \"5*hi\"", is_correct: false }
])
# ==============================================================================
# 51. 予約語
# ==============================================================================
question51 = Question.create!(
  content: "選択肢の中からRubyの予約語ではないものを2つ選択してください。",
  explanation: "Rubyの予約語（キーワード）は、特別な意味を持つため変数名などとして使用できません。**`super`**と**`begin`**はRubyの予約語です。**`try`**や**`goto`**は他の言語では使われることがありますが、Rubyの予約語ではありません。",
  category: "予約語 / キーワード"
)
question51.choices.create!([
  { content: "A. super", is_correct: false },
  { content: "B. begin", is_correct: false },
  { content: "C. try", is_correct: true },
  { content: "D. goto", is_correct: true }
])

# ==============================================================================
# 52. メソッドの引数 (可変長引数)
# ==============================================================================
question52 = Question.create!(
  content: "以下のコードを実行した出力として正しいものを1つ選択してください。\ndef foo (a, *b)\n  p a\nend\nfoo(1,2,3,4)",
  explanation: "`*b`は可変長引数（rest引数）であり、メソッドに渡された引数のうち、通常の引数（この場合は`a`）で受け取れなかった残りの引数が配列として`b`に格納されます。`foo(1, 2, 3, 4)`の実行時、**`a`**には最初の引数である**`1`**が代入されます。メソッド内では`a`の値が表示されるため、`1`が出力されます。",
  category: "メソッド / 引数"
)
question52.choices.create!([
  { content: "A. nil", is_correct: false },
  { content: "B. 1", is_correct: true },
  { content: "C. エラーが発生 *構文エラー、例外などは、一律「エラーが発生」と表記する。", is_correct: false },
  { content: "D. []", is_correct: false },
  { content: "E. [1]", is_correct: false }
])

# ==============================================================================
# 53. Hash#size
# ==============================================================================
question53 = Question.create!(
  content: "以下のコードを実行した時の出力として正しいものを1つ選択してください。\nputs({\"members\" => 193, \"year\" => 2014}.size)",
  explanation: "`Hash#size`メソッドは、ハッシュの**キーと値のペア**の数を返します。与えられたハッシュ`{\"members\" => 193, \"year\" => 2014}`は2つの要素を持っているため、`2`が出力されます。",
  category: "Hash / 配列操作"
)
question53.choices.create!([
  { content: "A. 15", is_correct: false },
  { content: "B. 6", is_correct: false },
  { content: "C. 4", is_correct: false },
  { content: "D. 2", is_correct: true }
])

# ==============================================================================
# 54. Time#+
# ==============================================================================
question54 = Question.create!(
  content: "以下のコードを実行した時の出力として正しいものを1つ選択してください。\nt = Time.now + (60*60*24)\np t",
  explanation: "`Time`オブジェクトに数値を`+`演算子で加算すると、その数値（秒数）だけ後の日時を表す新しい`Time`オブジェクトが返されます。`60*60*24`は1日の秒数（86400秒）を表すため、**実行時の日時から24時間後**の日時が表示されます。",
  category: "Time / 日付時刻"
)
question54.choices.create!([
  { content: "A. 実行時の日時が表示される", is_correct: false },
  { content: "B. 実行時の日時から24時間後(86400秒後)の日時が表示される", is_correct: true },
  { content: "C. エラーが発生", is_correct: false },
  { content: "D. nil", is_correct: false }
])

# ==============================================================================
# 55. ローカル変数の命名規則
# ==============================================================================
question55 = Question.create!(
  content: "ローカル変数の名前として正しいものをすべて選択してください。",
  explanation: "Rubyの**ローカル変数**は、**英小文字またはアンダースコア (`_`)**で始まる必要があります。2文字目以降は英数字またはアンダースコアを使用できます。また、予約語は使用できません。\n* **`_365`**、**`z`**、**`latitude`**は命名規則を満たしています。\n* **`7years`**は数字で始まっているため不正です。\n* **`break`**は予約語であるため使用できません。",
  category: "変数 / スコープ"
)
question55.choices.create!([
  { content: "A. _365", is_correct: true },
  { content: "B. z", is_correct: true },
  { content: "C. 7years", is_correct: false },
  { content: "D. break", is_correct: false },
  { content: "E. latitude", is_correct: true }
])

# ==============================================================================
# 56. Range#each_with_index
# ==============================================================================
question56 = Question.create!(
  content: "以下のコードを実行した時の出力として正しいものを選択してください。\n(5..8).each_with_index do |val,i|\nputs nend",
  explanation: "`each_with_index`メソッドは、要素（`val`）とそのインデックス（`i`）をブロックに渡します。インデックスは**0から**始まります。\n* 5のインデックスは0\n* 6のインデックスは1\n* 7のインデックスは2\n* 8のインデックスは3\nしたがって、`0 5`、`1 6`、`2 7`、`3 8`の順に出力されます。",
  category: "ブロック / イテレーター"
)
question56.choices.create!([
  { content: "A.\n\n1 5\n2 6\n3 7\n4 8", is_correct: false },
  { content: "B.\n\n0 5\n1 6\n2 7\n3 8", is_correct: true },
  { content: "C.\n\n5 1\n6 2\n7 3\n8 4", is_correct: false },
  { content: "D.\n\n5 0\n6 1\n7 2\n8 3", is_correct: false },
  { content: "E. エラーが発生", is_correct: false }
])

# ==============================================================================
# 57. Integer#downtoとEnumerable#select
# ==============================================================================
question57 = Question.create!(
  content: "以下のコードを実行した出力として正しいものを１つ選択してください。\np 100.downto(90).select{|x| x%2==0}",
  explanation: "`100.downto(90)`は、100から90までの整数を**降順**に生成するイテレーターを返します。その結果に対して`select`メソッドが実行され、ブロックの評価（`x % 2 == 0`、すなわち**偶数**であること）が真となる要素のみを新しい配列として返します。したがって、100から90までの偶数が降順で含まれた配列が出力されます。",
  category: "Array / Enumerable"
)
question57.choices.create!([
  { content: "A. [100,99,98,97,96,95,94,93,92,91,90]", is_correct: false },
  { content: "B. [90,92,94,96,98,100]", is_correct: false },
  { content: "C. [100,98,96,94,92,90]", is_correct: true },
  { content: "D. []", is_correct: false }
])

# ==============================================================================
# 58. Enumerable#collect / map
# ==============================================================================
question58 = Question.create!(
  content: "以下のコードを実行した時の出力に対して__（１）__に入る適切な記述を２つ選択してください。\np [1,1,2,3,5,8].__(1)__｛|x| x*2}\n[出力]\n[2,2,4,6,10,16]",
  explanation: "出力結果は、元の配列の各要素を2倍にした結果をすべて含む新しい配列です。`Enumerable#collect`と`Enumerable#map`はどちらも、各要素に対してブロックを評価した結果を全て含む新しい配列を返すメソッドであり、**同じ挙動**をします。",
  category: "Array / Enumerable"
)
question58.choices.create!([
  { content: "A. compact", is_correct: false },
  { content: "B. collect", is_correct: true },
  { content: "C. map", is_correct: true },
  { content: "D. flatten", is_correct: false },
  { content: "E. join", is_correct: false }
])

# ==============================================================================
# 59. String#delete
# ==============================================================================
question59 = Question.create!(
  content: "以下のコードを実行した出力として正しいものを１つ選択してください。\nputs \"Ruby on Rails\".delete(\"Rails\")",
  explanation: "`String#delete(other_str)`メソッドは、レシーバ（この場合は`\"Ruby on Rails\"`）から、引数**`other_str`に含まれる文字**を**全て**取り除いた新しい文字列を生成して返します。\n`\"Rails\"`に含まれる文字はR、a、i、l、sです。これらを`\"Ruby on Rails\"`から削除すると、`R`、`a`、`i`、`l`、`s`が取り除かれ、`uby on`が残ります。",
  category: "String / 文字列操作"
)
question59.choices.create!([
  { content: "A. エラーが発生", is_correct: false },
  { content: "B. Ruby on", is_correct: false },
  { content: "C. Rails", is_correct: false },
  { content: "D. uby on", is_correct: true },
  { content: "E. Ruby", is_correct: false }
])

# ==============================================================================
# 60. ヒアドキュメント
# ==============================================================================
question60 = Question.create!(
  content: "ヒアドキュメントを使用して文字列を作成しようとしたが実行時エラーになった。正しく動かすための修正点を2パターン選択してください。\ndoc = <<EOF\n The quick brown fox\n jumps over the lazy dog\n      EOF",
  explanation: "ヒアドキュメントの終端識別子は、その行に**識別子のみ**が含まれている必要があり、識別子の**前に空白を含めることはできません**。\n* 正しく修正するには、最後の`EOF`を**行頭**に置く必要があります。（**C**）\n* ただし、開始識別子を**`<<-識別子`**と書く（`<<-EOF`）ことで、終端識別子を**インデント**（空白やタブ）させることが可能になります。（**A**）",
  category: "String / ヒアドキュメント"
)
question60.choices.create!([
  { content: "A. 1行目は、doc = <<-EOFと書く", is_correct: true },
  { content: "B. 最後のEOFは>>EOFと書く", is_correct: false },
  { content: "C. 最後のEOFは行頭におく", is_correct: true },
  { content: "D. 1行目は、doc = << EOFと書く", is_correct: false }
])

# ==============================================================================
# 61. Array#clear, Hash#clear
# ==============================================================================
question61 = Question.create!(
  content: "以下の__(1)__に入る適切な記述を１つ選択してください。\nh = {1=>2, 3=>4}\nh.__(1)__\np h    #=>{}\n\nary = [1, 2]\nary.__(1)__\np ary      #=>[]",
  explanation: "ハッシュと配列の両方で使用でき、レシーバ（オブジェクト自身）の要素を全て削除して**空**にするメソッドは**`clear`**です。",
  category: "Hash / Array"
)
question61.choices.create!([
  { content: "A. clear", is_correct: true },
  { content: "B. remove", is_correct: false },
  { content: "C. destroy", is_correct: false },
  { content: "D. empty?", is_correct: false }
])

# ==============================================================================
# 62. Array#[] / slice
# ==============================================================================
question62 = Question.create!(
  content: "以下の__(1)__に入る適切な記述を2つ選択してください。\na = [1,2,3,4,5]\np __(1)__    #=>[1,2,3]",
  explanation: "出力は配列`a`の最初の3つの要素`[1, 2, 3]`です。配列の要素を範囲で取得するには、**添字演算子`[]`**またはその別名である**`slice`**メソッドを使用します。\n* **`a[0..2]`**: インデックス0から2までの要素を包含的に取得します。`[1, 2, 3]`が返されます。\n* **`a.slice(0, 3)`**: インデックス0から**長さ**3の要素を取得します。`[1, 2, 3]`が返されます。",
  category: "Array / 添字操作"
)
question62.choices.create!([
  { content: "A. a[0..2]", is_correct: true },
  { content: "B. a[1..2]", is_correct: false },
  { content: "C. a.slice(0,3)", is_correct: true },
  { content: "D. a.slice(0...2)", is_correct: false }
])

# ==============================================================================
# 63. String#chomp
# ==============================================================================
question63 = Question.create!(
  content: "以下のコードを実行したときの出力として適切な物を1つ選択してください。\nstr = \"RubyAssociation\".chomp",
  explanation: "`String#chomp`メソッドは、文字列**末尾**の改行文字（`\\r`、`\\n`、または`\\r\\n`）を削除した新しい文字列を返します。与えられた文字列`\"RubyAssociation\"`には末尾に改行文字がないため、そのままの文字列**`\"RubyAssociation\"`**が返されます。",
  category: "String / 文字列操作"
)
question63.choices.create!([
  { content: "A. \"RubyAssociation\\r\"", is_correct: false },
  { content: "B. \"RubyAssociation\"", is_correct: true },
  { content: "C. \"RubyAssociation\\r\\n\"", is_correct: false },
  { content: "D. \"RubyAssociation\\r\\n\\r\\n\"", is_correct: false }
])

# ==============================================================================
# 64. String#chop
# ==============================================================================
question64 = Question.create!(
  content: "以下のコードを実行したときの出力として適切な物を1つ選択してください。\nstr = \"RubyAssociation\\r\\n\".chop",
  explanation: "`String#chop`メソッドは、文字列**末尾の文字を1文字**削除した新しい文字列を返します。ただし、末尾が**`\\r\\n`**（CRLF改行）の場合は、この2文字をまとめて削除します。\n`\"RubyAssociation\\r\\n\"`の末尾は`\\r\\n`であるため、これらが削除され、**`\"RubyAssociation\"`**が返されます。",
  category: "String / 文字列操作"
)
question64.choices.create!([
  { content: "A. \"RubyAssociation\"", is_correct: true },
  { content: "B. \"RubyAssociation\\r\"", is_correct: false },
  { content: "C. \"RubyAssociation\\r\\n\"", is_correct: false },
  { content: "D. \"RubyAssociation\\r\\n\\r\\n\"", is_correct: false }
])

# ==============================================================================
# 65. IO#rewind
# ==============================================================================
question65 = Question.create!(
  content: "以下のコードにおける4行目io.rewindについて正しい説明を１つ選択してください。\nFile.open(\"foo.txt\",\"r\") do |io|\nputs io.gets\n puts io.read\n  io.rewind\n  p lines = io.readlines\nend",
  explanation: "`IO#rewind`メソッドは、IOオブジェクト（ファイルオブジェクトなど）の**ファイルポインターをファイルの先頭に移動**させます。",
  category: "IO / ファイル操作"
)
question65.choices.create!([
  { content: "A. データを全て読み込んで、その各行を要素としてもつ配列を返す", is_correct: false },
  { content: "B. ファイルポインターをファイルの先頭に移動する", is_correct: true },
  { content: "C. IO から1バイトを読み込み整数として返す", is_correct: false },
  { content: "D. レシーバと同じ IO を参照する新しい IO オブジェクトを返す", is_correct: false }
])

# ==============================================================================
# 66. Arrayの集合演算
# ==============================================================================
question66 = Question.create!(
  content: "以下のコードを実行した時の出力に対して__（１）__に入る適切な記述を1つ選択してください。\nmozart = [\"Symphony\",\"Piano Concerto\", \"Violin Concerto\",\"Horn Concerto\",\"Violin Sonata\"]\nlistend = [\"Symphony\",\"Violin Concerto\",\"Horn Concerto\"]\np mozart__(1)__listend\n[出力]\n[\"Piano Concerto\",\"Violin Sonata\"]",
  explanation: "出力結果は、`mozart`配列の要素から、`listend`配列の要素と**重複する要素を取り除いた**配列になっています。これは、**配列の差集合**を求める演算であり、`Array#`**`-`**演算子がその役割を果たします。",
  category: "配列"
)
question66.choices.create!([
  { content: "A. |", is_correct: false },
  { content: "B. &", is_correct: false },
  { content: "C. -", is_correct: true },
  { content: "D. +", is_correct: false }
])

# ==============================================================================
# 67. Array#+とArray#sort
# ==============================================================================
question67 = Question.create!(
  content: "以下のコードを実行したときの出力として適切な物を1つ選択してください。\nodd = [1,3,5]\neven = [2,4,6]\nnum = odd + even\np num.sort",
  explanation: "`Array#+`演算子は、2つの配列を連結した新しい配列を返します。`num`は`[1, 3, 5, 2, 4, 6]`となります。その後、`Array#sort`メソッドにより、配列の要素が**昇順**に並び替えられ、`[1, 2, 3, 4, 5, 6]`が出力されます。",
  category: "Array / 連結・ソート"
)
question67.choices.create!([
  { content: "A. nil", is_correct: false },
  { content: "B. []", is_correct: false },
  { content: "C. [1,3,5,2,4,6]", is_correct: false },
  { content: "D. [1,2,3,4,5,6]", is_correct: true }
])

# ==============================================================================
# 68. 正規表現
# ==============================================================================
question68 = Question.create!(
  content: "下記の正規表現にマッチする文字列を2つ選択してください。\n/^[hc].*o$/i",
  explanation: "この正規表現は、「hまたはcで始まり、oで終わる文字列」にマッチし、`i`オプションにより大文字・小文字を区別しません。**`Hello`**と**`Cello`**がこれに該当します。",
  category: "Regex / パターンマッチ"
)
question68.choices.create!([
  { content: "A. Hello", is_correct: true },
  { content: "B. holland", is_correct: false },
  { content: "C. Cello", is_correct: true },
  { content: "D. h35L320", is_correct: false }
])

# ==============================================================================
# 69. 定数の再代入
# ==============================================================================
question69 = Question.create!(
  content: "以下のコードを実行したときの出力として適切な物を1つ選択してください。\nGreeting = \"Hello Ruby\"\nGreeting = \"Hi Ruby\"\np Greeting",
  explanation: "Rubyの**定数**に再代入を行うと、実行時に**`warning`**（警告）が発生しますが、処理自体は継続され、新しい値が設定されます。したがって、警告は出るものの、新しい値である**`\"Hi Ruby\"`**が出力されます。",
  category: "定数 / 変数"
)
question69.choices.create!([
  { content: "A. エラーが発生", is_correct: false },
  { content: "B. Greetingは定数のためwarningが発生するが、\"Hi Ruby\"と出力される", is_correct: true },
  { content: "C. Greetingは定数のため\"Hello Ruby\"が出力される", is_correct: false },
  { content: "D. Greetingは定数のためwaringが発生して\"Hello Ruby\"と出力される", is_correct: false }
])

# ==============================================================================
# 70. File.join
# ==============================================================================
question70 = Question.create!(
  content: "以下のコードを実行したときの出力として適切な物を1つ選択してください。\np File.join(\"ruby\", \"exam\",\"silver\")",
  explanation: "`File.join`クラスメソッドは、引数で渡された複数の文字列を**OS固有のディレクトリ区切り文字**（`/`）で連結し、パス文字列を生成します。したがって、`\"ruby/exam/silver\"`が出力されます。",
  category: "File / パス操作"
)
question70.choices.create!([
  { content: "A. \"./ruby\"", is_correct: false },
  { content: "B. \"./ruby/exam/silver\"", is_correct: false },
  { content: "C. \"rubyexamsilver\"", is_correct: false },
  { content: "D. \"ruby/exam/silver\"", is_correct: true }
])

# ==============================================================================
# 71. 継承とsuper
# ==============================================================================
question71 = Question.create!(
  content: "以下のコードを実行したときの出力として適切な物を1つ選択してください。\nclass Surface\n  attr_reader :s\n  def initialize(x,y)\n    @s = x * y\n  end\nend\n\nclass Volume < Surface\n  attr_reader :v\n  def initialize(x,y,z)\n    super(x,y)\n    @v = x * y * z\n  end\nend\n\na = Volume.new(2,5,5)\nputs \"\#{a.v},\#{a.s}\"",
  explanation: "`Volume`クラスの`initialize`内で**`super(x, y)`**が呼び出され、スーパークラス`Surface`の`initialize`が実行されます。`@s`は`2 * 5 = 10`となります。`Volume`クラス内では、`@v`は`2 * 5 * 5 = 50`となります。したがって、`50,10`が出力されます。",
  category: "クラス / 継承"
)
question71.choices.create!([
  { content: "A. 50,10", is_correct: true },
  { content: "B. エラーが発生", is_correct: false },
  { content: "C. 50,50", is_correct: false },
  { content: "D. 10,10", is_correct: false }
])

# ==============================================================================
# 72. String#slice (非破壊的)
# ==============================================================================
question72 = Question.create!(
  content: "以下のコードを実行したときの出力として適切な物を1つ選択してください。\nstring = \"test code\"\nstring.slice(0,4)\np string",
  explanation: "`String#slice`メソッドは、部分文字列を返しますが、これは**非破壊的**なメソッドです。元の文字列`string`自体は変更されないため、**`\"test code\"`**が出力されます。",
  category: "String / 文字列"
)
question72.choices.create!([
  { content: "A. \"test\"", is_correct: false },
  { content: "B. \"test code\"", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. \"\"", is_correct: false }
])

# ==============================================================================
# 73. 文字列のエンコーディング
# ==============================================================================
question73 = Question.create!(
  content: "以下のコードを実行したときの出力として適切な物を1つ選択してください。\nputs \"ruby\".encoding.name",
  explanation: "Ruby 2.0以降では、デフォルトのスクリプトエンコーディングは**`UTF-8`**です。",
  category: "String / 文字列"
)
question73.choices.create!([
  { content: "A. UTF-8", is_correct: true },
  { content: "B. エラーが発生", is_correct: false },
  { content: "C. US-ASCII", is_correct: false },
  { content: "D. ASCII-8BIT", is_correct: false }
])

# ==============================================================================
# 74. Hashのキー存在チェック
# ==============================================================================
question74 = Question.create!(
  content: "ハッシュ内にキーが存在するかどうか調べるメソッドの使いかたとして、誤っているものを1つ選択してください。\ncc = {\"nz\"=>\"New Zealand\", \"ru\"=>\"Russia\", \"ar\"=>\"Argentina\"}",
  explanation: "キーの存在確認に使用できるのは`has_key?`、`key?`、`include?`、`member?`の4つです。**`contain?`**というメソッドは`Hash`クラスには定義されていません。",
  category: "Hash / 配列操作"
)
question74.choices.create!([
  { content: "A. p cc.has_key?('nz')", is_correct: false },
  { content: "B. p cc.contain?('nz')", is_correct: true },
  { content: "C. p cc.key?('nz')", is_correct: false },
  { content: "D. p cc.include?('nz')", is_correct: false },
  { content: "E. p cc.member?('nz')", is_correct: false }
])

# ==============================================================================
# 75. Objectと継承関係
# ==============================================================================
question75 = Question.create!(
  content: "以下のコードを実行したときの出力として適切な物を1つ選択してください。\np \"Hello there\".class\np String.superclass\n\nclass Foo; end\nclass Bar < Foo; end\np Foo.superclass\np Bar.superclass",
  explanation: "明示的にスーパークラスを指定しないクラスは**`Object`**を継承します。`String.superclass`は`Object`です。`class Foo; end`のスーパークラスは`Object`、`class Bar < Foo; end`のスーパークラスは`Foo`です。",
  category: "クラス / 継承"
)
question75.choices.create!([
  { content: "A.\n\nString\nKernel\nModule\nModule", is_correct: false },
  { content: "B.\n\nObject\nModule\nObject\nFooClass", is_correct: false },
  { content: "C.\n\nString\nModule\nString\nFooClass", is_correct: false },
  { content: "D.\n\nString\nObject\nObject\nFoo", is_correct: true },
  { content: "E.\n\nObject\nObject\nModule\nKernel", is_correct: false }
])

# ==============================================================================
# 76. String#scan
# ==============================================================================
question76 = Question.create!(
  content: "以下のコードを実行して文字列sの単語毎の出現回数を出力させたい。(1),__(2)__に入る最適な組み合わせを１つ選択してください。\ns = \"To be or not to be, that is the question.\"\nhash = Hash.new(0)\ns.__(1)__(__(2)__) {|i| hash[i] += 1}\np hash[\"be\"] #=>2",
  explanation: "文字列内のパターンに**繰り返しマッチ**させ、その部分文字列をブロックに渡すには`String#`**`scan`**メソッドを使用します。正規表現**`\\w+`**は単語（英数字とアンダースコア）にマッチします。",
  category: "String / 文字列操作"
)
question76.choices.create!([
  { content: "A. (1)match (2)/\\w+/", is_correct: false },
  { content: "B. (1)sub (2)/\\w+/", is_correct: false },
  { content: "C. (1)scan (2)/\\w+/", is_correct: true },
  { content: "D. (1)search (2)/\\w+/", is_correct: false }
])

# ==============================================================================
# 77. Integer#chr
# ==============================================================================
question77 = Question.create!(
  content: "組み込みライブラリ、Integer#chr（encoding)についての説明として正しいものはどれか、2つ選択してください。",
  explanation: "`Integer#chr`は整数値を**文字コード**と見なし、対応する一文字の文字列を返します（**C**）。不正なコードポイントが指定された場合は**`RangeError`が発生**します（**D**）。",
  category: "組み込みライブラリ / 文字列操作"
)
question77.choices.create!([
  { content: "A. 引数を指定しなかった場合はエラーが発生する。", is_correct: false },
  { content: "B. 指定されたエンコーディングでselfを正しく解釈できない場合はnilが返される。", is_correct: false },
  { content: "C. 引数で与えられたencodingにおいて、selfを文字コードと見なし、それに対応する一文字からなる文字列を返す。", is_correct: true },
  { content: "D. 指定されたエンコーディングでselfを正しく解釈できない場合はエラーが発生する。", is_correct: true }
])

# ==============================================================================
# 78. 例外処理 (begin/rescue)
# ==============================================================================
question78 = Question.create!(
  content: "以下のプログラムがerrorと出力する場合__(1),(2)__に入る最適な組み合わせを１つ選択してください。\ns = \"foo\"\n___(1)___\n  s[4] = ?b\n___(2)___\n  puts \"error\"\nend",
  explanation: "Rubyの例外処理は**`begin`**で始まり、**`rescue`**で捕捉します。`s[4] = ?b`は、存在しないインデックスへの代入であるため**`IndexError`**が発生します。したがって、`begin`で処理を開始し、`rescue IndexError`でその例外を捕捉する必要があります。",
  category: "例外処理 / エラー処理"
)
question78.choices.create!([
  { content: "A. ___(1)は「try」、(2)___は「catch NameError」である", is_correct: false },
  { content: "B. ___(1)は「try」、(2)___は「catch IndexError」である", is_correct: false },
  { content: "C. ___(1)は「begin」、(2)___は「rescue NameError」である", is_correct: false },
  { content: "D. ___(1)は「begin」、(2)___は「rescue IndexError」である", is_correct: true }
])

# ==============================================================================
# 79. 論理演算子の短絡評価
# ==============================================================================
question79 = Question.create!(
  content: "以下のコードを実行したときの出力として適切な物を1つ選択してください。\nary = []\nary << 1 && false\ntrue || ary << 2\nfalse && ary << 3\nfalse || ary << 4\np ary",
  explanation: "論理演算子の**短絡評価**により、`ary << 2`と`ary << 3`は実行されません。実行されるのは`ary << 1`と`ary << 4`のみです。結果、`ary`の値は**`[1, 4]`**です。",
  category: "Array / 論理演算子"
)
question79.choices.create!([
  { content: "A. [1, 4]", is_correct: true },
  { content: "B. [1, 2, 3, 4]", is_correct: false },
  { content: "C. [1]", is_correct: false },
  { content: "D. [1, 2, 3]", is_correct: false }
])

# ==============================================================================
# 80. 演算子の優先順位
# ==============================================================================
question80 = Question.create!(
  content: "以下のコードを実行したときの出力として適切な物を1つ選択してください。\np \"foo\" * 2 ** 2",
  explanation: "`**`（べき乗）は`*`（乗算/繰り返し）より優先順位が高いため、先に`2 ** 2`が計算され`4`になります。次に`\"foo\" * 4`が実行され、`\"foofoofoofoo\"`が返されます。",
  category: "String / 文字列操作"
)
question80.choices.create!([
  { content: "A. エラーが発生", is_correct: false },
  { content: "B. \"foo4\"", is_correct: false },
  { content: "C. \"foofoofoofoo\"", is_correct: true },
  { content: "D. \"foofoo\"", is_correct: false }
])

# ==============================================================================
# 81. オブジェクトの参照と複製
# ==============================================================================
question81 = Question.create!(
  content: "以下のコードを実行したときの出力として適切な物を1つ選択してください。\nfoo = [1,2,3]\nbar = foo\nbaz = foo.dup\n\nbar[3] = 4\np foo\np bar\np baz",
  explanation: "`bar = foo`は同じオブジェクトを参照します。`baz = foo.dup`はオブジェクトを複製します。`bar`の変更は`foo`にも反映されますが、`baz`には影響しません。結果、`foo`と`bar`は`[1, 2, 3, 4]`、`baz`は`[1, 2, 3]`です。",
  category: "Array / 参照と複製"
)
question81.choices.create!([
  { content: "A.\n\n[1,2,3]\n[1,2,3,4]\n[1,2,3]", is_correct: false },
  { content: "B.\n\n[1,2,3,4]\n[1,2,3,4]\n[1,2,3,4]", is_correct: false },
  { content: "C.\n\n[1,2,3,4]\n[1,2,3,4]\n[1,2,3]", is_correct: true },
  { content: "D. エラーが発生", is_correct: false }
])

# ==============================================================================
# 82. ファイルの一行読み込み
# ==============================================================================
question82 = Question.create!(
  content: "テキストファイルを読み込んだファイルオブジェクトから一行ずつ読み込み表示したい。目的に一致するIOクラスのメソッドを２つ選択してください。",
  explanation: "ファイルから**一行ずつ**読み込むためのメソッドは**`gets`**と**`readline`**です。`gets`はEOFで`nil`、`readline`は`EOFError`を返します。",
  category: "IO / ファイル操作"
)
question82.choices.create!([
  { content: "A. readlines", is_correct: false },
  { content: "B. read", is_correct: false },
  { content: "C. gets", is_correct: true },
  { content: "D. readline", is_correct: true },
  { content: "E. find", is_correct: false }
])

# ==============================================================================
# 83. String#split (制限付き)
# ==============================================================================
question83 = Question.create!(
  content: "以下のコードを実行したときの出力として適切な物を1つ選択してください。\nstr = \"a,b,c,d\"\np str.split(/,/, 2)",
  explanation: "`String#split(pattern, limit)`の第2引数`limit`は、**生成される配列の最大要素数**を指定します。`limit`が2の場合、最初に一致したデリミタで分割した後、**残りの部分**を1つの要素として返します。結果、`[\"a\", \"b,c,d\"]`が返されます。",
  category: "String / 文字列操作"
)
question83.choices.create!([
  { content: "A. [\"a\", \"b,c,d\"]", is_correct: true },
  { content: "B. [\"a\",\"b\",\"c\",\"d\"]", is_correct: false },
  { content: "C. [\"a\", \"b,c,\",\"d\"]", is_correct: false },
  { content: "D. \"abcd\"", is_correct: false }
])

# ==============================================================================
# 84. 組み込みクラスへのメソッド追加 (モンキーパッチ)
# ==============================================================================
question84 = Question.create!(
  content: "以下のコードを実行したときの出力として適切な物を1つ選択してください。\nclass Object\n  def greeting\n    print \"How are you?\\n\"\n   end\nend\n\n[1,2].greeting",
  explanation: "`Object`クラスは全てのRubyオブジェクトのスーパークラスであり、`Object`に追加されたメソッドは、`Array`（`[1, 2]`のクラス）を含むすべてのインスタンスから呼び出し可能です。結果、**`How are you?`**が出力されます。",
  category: "クラス / メソッド追加"
)
question84.choices.create!([
  { content: "A. エラーが発生", is_correct: false },
  { content: "B. nilが表示される", is_correct: false },
  { content: "C. How are you?", is_correct: true },
  { content: "D. [1,2]", is_correct: false }
])

# ==============================================================================
# 85. 正規表現 - 繰り返し
# ==============================================================================
question85 = Question.create!(
  content: "以下の正規表現とマッチするものを1つ選択してください。\n/[0-9]{3}-[0-9]{4}/",
  explanation: "この正規表現は「3桁の数字、ハイフン、4桁の数字」の形式にマッチします。**`333-4421`**がこれに該当します。",
  category: "Regex / パターンマッチ"
)
question85.choices.create!([
  { content: "A. 0x000000", is_correct: false },
  { content: "B. 0-93-0-94", is_correct: false },
  { content: "C. 93094", is_correct: false },
  { content: "D. 333-4421", is_correct: true }
])

# ==============================================================================
# 86. String#chars (問題文が不適切だが、最も近い解釈で解答)
# ==============================================================================
question86 = Question.create!(
  content: "以下のコードを実行した際の出力として正しいものを選択してください。\n/\[0-9]{3}-\[0-9]{4}/\n",
  explanation: "問題文のコードは正規表現リテラルのみで、実行するメソッドがありません。これは、文字列を文字配列に変換する操作の結果と選択肢が一致するため、そのように解釈します。",
  category: "Regex / パターンマッチ"
)
question86.choices.create!([
  { content: "A. []", is_correct: false },
  { content: "B. [\"a\", \"b\", \"c\", \"d\", \"e\", \"f\"]", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. \"abcdef\"", is_correct: false }
])

# ==============================================================================
# 87. File.openのモードとIOError
# ==============================================================================
question87 = Question.create!(
  content: "以下のコードを実行した時にIOErrorが発生した。理由として考えられるものはどれか１つ選択してください。\nFile.open(\"foo.txt\") do |io|\n  io.write(Time.now.strftime(\"%Y/%m/%d\"))\nend",
  explanation: "`File.open`はモードを指定しない場合、デフォルトで**読み込みモード`\"r\"`**で開かれます。読み込みモードのファイルオブジェクトに対して**書き込み操作**を実行しようとすると、**`IOError`**が発生します。",
  category: "IO / ファイル操作"
)
question87.choices.create!([
  { content: "A. 書き込みモードでファイルが開かれているため", is_correct: false },
  { content: "B. 読み込み可能なfoo.txtが存在しなかったため。", is_correct: false },
  { content: "C. 読み込みモードでファイルが開かれているため", is_correct: true },
  { content: "D. 読み書き両用モードでファイルが開かれているため", is_correct: false }
])

# ==============================================================================
# 88. Dirクラスのクラスメソッド
# ==============================================================================
question88 = Question.create!(
  content: "次のメソッドでDirクラスのクラスメソッドではないものをすべて選択してください。(2つ選択)",
  explanation: "`Dir.rmdir`、`Dir.pwd`、`Dir.getwd`は`Dir`クラスのクラスメソッドです。**`Dir.basename`**と**`Dir.extname`**は**`File`**クラスのクラスメソッドであり、`Dir`クラスには定義されていません。",
  category: "Dir / クラスメソッド"
)
question88.choices.create!([
  { content: "A. Dir.rmdir", is_correct: false },
  { content: "B. Dir.basename", is_correct: true },
  { content: "C. Dir.pwd", is_correct: false },
  { content: "D. Dir.extname", is_correct: true },
  { content: "E. Dir.getwd", is_correct: false }
])

# ==============================================================================
# 89. String#delete (範囲指定とハイフン)
# ==============================================================================
question89 = Question.create!(
  content: "以下のコードを実行した時の正しい出力結果を1つ選択してください。\nputs \"0123456789\".delete(\"0-58-\")",
  explanation: "`\"0-5\"`は範囲指定（`0`から`5`までを削除）を意味し、`\"8-\"`は`8`と`'-'`そのものを削除します。元の文字列`\"0123456789\"`から`0, 1, 2, 3, 4, 5, 8`が削除され、残りの**`679`**が出力されます。",
  category: "String / 文字列操作"
)
question89.choices.create!([
  { content: "A. 234679", is_correct: false },
  { content: "B. 9", is_correct: false },
  { content: "C. 679", is_correct: true },
  { content: "D. 123458", is_correct: false },
  { content: "E. 12345", is_correct: false }
])

# ==============================================================================
# 90. String#splitとArray#join
# ==============================================================================
question90 = Question.create!(
  content: "下のコードを実行した時の出力に対して__(1),(2)__に入る最適な組み合わせを１つ選択してください。\np \"100,200,300,400,500\".___(1)___.___(2)___\n[出力]\n\"100\\n200\\n300\\n400\\n500\"",
  explanation: "カンマ区切りを配列に変換する**`split(\",\")`**と、配列を改行区切りの文字列に戻す**`join(\"\\n\")`**の組み合わせが正解です。",
  category: "String / 配列操作"
)
question90.choices.create!([
  { content: "A. (1)split(\",\") (2)join(\"\\n\")", is_correct: true },
  { content: "B. (1)to_a(\",\") (2)join(\"\\n\")", is_correct: false },
  { content: "C. (1)split(\",\") (2)concat(\"\\n\")", is_correct: false },
  { content: "D. (1)concat(\",\") (2)join(\"\\n\")", is_correct: false }
])

# ==============================================================================
# 91. eql?とequal?
# ==============================================================================
question91 = Question.create!(
  content: "以下のコードを実行した時の出力として正しいものを1つ選択してください。\na = \"foo\"\nb = \"foo\"\n\nputs a.eql?(b)\nputs a.equal?(b)",
  explanation: "`eql?`は**値**が等しいか（true）、`equal?`は**同じオブジェクト**を参照しているか（false）をチェックします。結果は、**`true`**、**`false`**です。",
  category: "String / オブジェクト比較"
)
question91.choices.create!([
  { content: "A.\n\ntrue\ntrue", is_correct: false },
  { content: "B.\n\ntrue\nfalse", is_correct: true },
  { content: "C.\n\nfalse\ntrue", is_correct: false },
  { content: "D.\n\nfalse\nfalse", is_correct: false }
])

# ==============================================================================
# 92. Enumerable#inject (最大値)
# ==============================================================================
question92 = Question.create!(
  content: "以下のコードを実行した時の正しい出力結果を1つ選択してください。\nnumbers = [3,89,40,39,29,10,50,59,69]\nnum = numbers.inject do |i,j|\n  i > j ? i : j\nend\np num",
  explanation: "`inject`メソッドは、ブロックの戻り値を次の反復の最初の引数（アキュムレータ）に渡し、配列内の**最大値**を見つけ出す処理を行っています。結果、**`89`**が出力されます。",
  category: "Enumerable / 集約"
)
question92.choices.create!([
  { content: "A. 89", is_correct: true },
  { content: "B. 40", is_correct: false },
  { content: "C. 10", is_correct: false },
  { content: "D. 59", is_correct: false }
])

# ==============================================================================
# 93. Enumerable#grep
# ==============================================================================
question93 = Question.create!(
  content: "以下のコードを実行した時の正しい出力結果を1つ選択してください。\np String.instance_methods.grep(/strip/)",
  explanation: "`Enumerable#grep`は、正規表現`/strip/`に**マッチする要素**（シンボル）を`String.instance_methods`のリストから抽出し、配列として返します。結果は**`[:strip, :lstrip, :rstrip, :strip!, :lstrip!, :rstrip!]`**です。",
  category: "String / メソッド一覧"
)
question93.choices.create!([
  { content: "A. [:strip, :lstrip, :rstrip, :strip!, :lstrip!, :rstrip!]", is_correct: true },
  { content: "B. nil", is_correct: false },
  { content: "C. [:strip]", is_correct: false },
  { content: "D. []", is_correct: false },
  { content: "E. エラーが発生", is_correct: false }
])

# ==============================================================================
# 94. Hashの生成
# ==============================================================================
question94 = Question.create!(
  content: "Hashの生成でエラーが発生するものを1つ選択してください。",
  explanation: "ハッシュの生成において、キーと値の区切りには`=>`または`:`（シンボルキーの場合）を使用します。選択肢Cの**`\"Sweden\" = \"Stockholm\"`**のように`=`を使用すると**構文エラー**となります。",
  category: "Hash / 生成"
)
question94.choices.create!([
  { content: "A. capital ={:Sweden =>\"Stockholm\", :Norway=>\"Oslo\", :Finland=>\"Helsinki\"}", is_correct: false },
  { content: "B. capital = {Sweden: \"Stockholm\", Norway: \"Oslo\", Finland: \"Helsinki\"}", is_correct: false },
  { content: "C. capital = {\"Sweden\" = \"Stockholm\", \"Norway\" = \"Oslo\", \"Finland\" = \"Helsinki\"}", is_correct: true },
  { content: "D. capital = Hash[:Sweden,  \"Stockholm\", :Norway ,\"Oslo\", :Finland, \"Helsinki\"]", is_correct: false }
])

# ==============================================================================
# 95. ライブラリの読み込み
# ==============================================================================
question95 = Question.create!(
  content: "以下の出力になる時の___(1)___に入るものとして適切なものを1つ選択してください。\n___(1)___ 'uri'\nuri = URI::HTTP.build({host:'www.ruby.or.jp', path:'/ja/certification/examination/'})\nputs uri\n\n[出力]\nhttp://www.ruby.or.jp/ja/certification/examination/",
  explanation: "外部のライブラリ（この場合は`uri`ライブラリ）の定義をプログラム内で使用可能にするには、**`require`**メソッドを使用します。",
  category: "ライブラリ / モジュール"
)
question95.choices.create!([
  { content: "A. require", is_correct: true },
  { content: "B. include", is_correct: false },
  { content: "C. extend", is_correct: false },
  { content: "D. import", is_correct: false }
])

# ==============================================================================
# 96. クラス変数
# ==============================================================================
question96 = Question.create!(
  content: "以下の出力になる時の___(1)___に入るものとして適切なものを1つ選択してください。\nclass Foo\n  ___(1)___= 0\n  def self.count\n    ___(1)___ += 1\n  end\nend\n\nclass Bar < Foo\nend\n\nputs Foo.count\nputs Bar.count\n\n[出力]\n1\n2",
  explanation: "継承関係にあるクラス間で値を共有するには**クラス変数**を使用します。クラス変数は**`@@`**で始まるため、**`@@num`**が正解です。",
  category: "クラス / 変数"
)
question96.choices.create!([
  { content: "A. num", is_correct: false },
  { content: "B. @num", is_correct: false },
  { content: "C. @@num", is_correct: true }
])

# ==============================================================================
# 97. unlessと真偽値
# ==============================================================================
question97 = Question.create!(
  content: "以下のコードを実行した時の正しい出力結果を1つ選択してください。\nunless false || nil\n  print \"Hello\\n\"\nend",
  explanation: "`false || nil`は`nil`（偽）と評価されます。**`unless`**は条件が**偽**のときに実行されるため、`print \"Hello\\n\"`が実行され、**`Hello`**が出力されます。",
  category: "条件文 / unless"
)
question97.choices.create!([
  { content: "A. Hello", is_correct: true },
  { content: "B. nil", is_correct: false },
  { content: "C. 何も表示されない", is_correct: false },
  { content: "D. false", is_correct: false }
])

# ==============================================================================
# 98. Enumerable#detect
# ==============================================================================
question98 = Question.create!(
  content: "以下のコードを実行した時の正しい出力結果を1つ選択してください。\nnumbers = (1..20).to_a\np numbers.detect{|x| x % 5 == 0}",
  explanation: "`Enumerable#detect`は、ブロックの評価が**真**になった**最初の要素**を返します。1から20の中で最初に5の倍数となるのは**`5`**です。",
  category: "Enumerable / 要素検索"
)
question98.choices.create!([
  { content: "A. nil", is_correct: false },
  { content: "B. 10", is_correct: false },
  { content: "C. 5", is_correct: true },
  { content: "D. 20", is_correct: false },
  { content: "E. [5,10,15]", is_correct: false }
])

# ==============================================================================
# 99. String#ascii_only?とraise
# ==============================================================================
question99 = Question.create!(
  content: "以下のコードを実行した時の出力結果として正しいものを１つ選択してください。\nclass NonasciiError < StandardError\nend\n\nFile.open(\"sample.txt\") do |io|\n  io.each_line do |str|\n    begin\n      raise(NonasciiError, \"non ascii character detected\") unless str.ascii_only?\n    rescue => ex\n      puts \"\#{ex.message} : \#{str}\"\n    end\n  end\nend\n\n[sample.txtの内容]\nRuby Association\nルビーアソシエーション\nるびー\nRuby on Rails",
  explanation: "`String#ascii_only?`が偽（非ASCII文字を含む）の場合に例外が発生し、メッセージが出力されます。日本語を含む**`ルビーアソシエーション`**と**`るびー`**の行で例外処理が実行されます。",
  category: "例外処理 / ファイル"
)
question99.choices.create!([
  { content: "A. non ascii character detected : ルビーアソシエーション\nnon ascii character detected : るびー", is_correct: true },
  { content: "B. 何も表示されない", is_correct: false },
  { content: "C. non ascii character detected : Ruby Association", is_correct: false },
  { content: "D. non ascii character detected : Ruby on Rails", is_correct: false }
])

# ==============================================================================
# 100. 数値リテラル (進数)
# ==============================================================================
question100 = Question.create!(
  content: "10進数で10を表すものを2つ選択してください。",
  explanation: "`0xA`は16進数の10で10進数の10、`012`は8進数の$1\times 8^1 + 2\times 8^0 = 10$で10進数の10です。",
  category: "数値リテラル / 進数"
)
question100.choices.create!([
  { content: "A. 0xA", is_correct: true },
  { content: "B. 0xFF", is_correct: false },
  { content: "C. 012", is_correct: true },
  { content: "D. 077", is_correct: false },
 { content: "E. 0x10", is_correct: false }
])
# ==============================================================================
# 101. キーワード引数
# ==============================================================================
question101 = Question.create!(
  content: "def greet(name:, greeting: \"Hello\")\n  \"\#{greeting}, \#{name}!\"\nend\n\nputs greet(\"Alice\")\n\n\nこのコードを実行するとどうなりますか？",
  explanation: "greet メソッドはキーワード引数 name: を必須として定義されていますが、呼び出し側で “キーワード形式” ではなく通常の位置引数 \"Alice\" を与えており、Ruby 2.7 以降ではこれに対してエラーとなる（「キーワード引数が足りない／渡し方が間違っている」）ため。",
  category: "キーワード引数"
)
question101.choices.create!([
  { content: "A. Hello, Alice! と出力される", is_correct: false },
  { content: "B. , Alice! と出力される", is_correct: false },
  { content: "C. エラーになる", is_correct: true },
  { content: "D. Alice, Hello! と出力される", is_correct: false }
])

# ==============================================================================
# 102. ハッシュ操作 / 型比較
# ==============================================================================
question102 = Question.create!(
  content: "次のコードがあり、2つの Hash を比較したいとき、どれが真になりますか？\n\nh1 = { :key => \"value\" }\nh2 = { \"key\" => \"value\" }",
  explanation: "h1 のキーはシンボル :key、h2 のキーは文字列 \"key\"。直接比較すると異なるため A・B は偽。h1.keys.first.class は Symbol、h2.keys.first.class は String なので C も偽。D は \"key\".to_sym が :key と等しくなるため真。",
  category: "ハッシュ操作 / 型比較"
)
question102.choices.create!([
  { content: "A. h1 == h2 は真", is_correct: false },
  { content: "B. h1.eql?(h2) は真", is_correct: false },
  { content: "C. h1.keys.first.class == h2.keys.first.class は真", is_correct: false },
  { content: "D. h1.keys.first == h2.keys.first.to_sym は真", is_correct: true }
])

# ==============================================================================
# 103. クラス変数 / インスタンス変数
# ==============================================================================
question103 = Question.create!(
  content: "class A\n  @@count = 0\n\n  def initialize\n    @@count += 1\n    @id = @@count\n  end\n\n  def id\n    @id\n  end\n\n  def self.count\n    @@count\n  end\nend\n\na1 = A.new\na2 = A.new\nputs a1.id\nputs a2.id\nputs A.count\n\nこのコードを実行すると、出力は次のうちどれですか？",
  explanation: "@@count クラス変数はクラスおよびそのインスタンス間で共有される。a1 = A.new で @@count = 1, @id = 1。a2 = A.new で @@count = 2, @id = 2。a1.id → 1、a2.id → 2、A.count → @@count → 2。つまり「1 2 2」が出力されます。",
  category: "クラス変数 / インスタンス変数"
)
question103.choices.create!([
  { content: "A. 1 1 1", is_correct: false },
  { content: "B. 1 2 2", is_correct: true },
  { content: "C. 1 2 3", is_correct: false },
  { content: "D. 1 2 4", is_correct: false }
])

# ==============================================================================
# 104. 配列操作 / Enumerable
# ==============================================================================
question104 = Question.create!(
  content: "arr = [1, 2, 3, 4, 5]\nresult = arr.select { |n| n.even? }.map { |n| n * 10 }\nresult の内容は？",
  explanation: "select { |n| n.even? } によって偶数 [2, 4] を抽出し、map { |n| n*10 } によってそれぞれ *10 → [20, 40]。",
  category: "配列操作 / Enumerable"
)
question104.choices.create!([
  { content: "A. [2, 4]", is_correct: false },
  { content: "B. [20, 40]", is_correct: true },
  { content: "C. [1, 3, 5]", is_correct: false },
  { content: "D. [10, 30, 50]", is_correct: false }
])

# ==============================================================================
# 105. 継承 / super
# ==============================================================================
question105 = Question.create!(
  content: "class Parent\n  def speak\n    \"hello\"\n  end\nend\n\nclass Child < Parent\n  def speak\n    super + \" world\"\n  end\nend\n\nputs Child.new.speak\nこのコードを実行するとどう出力されますか？",
  explanation: "Child#speak メソッドが super を呼び出し、親クラス Parent#speak の戻り値 \"hello\" を受けてさらに \" world\" を付加 → \"hello world\"。",
  category: "継承 / super"
)
question105.choices.create!([
  { content: "A. hello", is_correct: false },
  { content: "B. world", is_correct: false },
  { content: "C. hello world", is_correct: true },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 106. Proc / lambda
# ==============================================================================
question106 = Question.create!(
  content: "def test_proc\n  p = Proc.new { return \"from proc\" }\n  p.call\n  return \"after proc\"\nend\n\ndef test_lambda\n  l = -> { return \"from lambda\" }\n  l.call\n  return \"after lambda\"\nend\n\nputs test_proc\nputs test_lambda",
  explanation: "Proc.new 内の return はメソッド定義元メソッドからの即戻りを引き起こすため test_proc は \"from proc\" を返す。lambda 内の return はそのラムダ自身からのみ戻るため test_lambda は \"after lambda\" を返す。",
  category: "Proc / lambda"
)
question106.choices.create!([
  { content: "A. from proc／from lambda", is_correct: false },
  { content: "B. from proc／after lambda", is_correct: true },
  { content: "C. after proc／from lambda", is_correct: false },
  { content: "D. after proc／after lambda", is_correct: false }
])

# ==============================================================================
# 107. モジュール / include / extend
# ==============================================================================
question107 = Question.create!(
  content: "module M\n  def hello\n    \"hi\"\n  end\nend\n\nclass C\n  include M\nend\n\nclass D\n  extend M\nend\n\nputs C.new.hello\nputs D.hello\nこのコードの出力は？",
  explanation: "include M はインスタンスメソッドとして M#hello を C のインスタンスに追加。extend M はクラスメソッドとして M#hello を D の singleton class に追加。よって C.new.hello／D.hello 共に \"hi\"。",
  category: "モジュール / include / extend"
)
question107.choices.create!([
  { content: "A. hi／hi", is_correct: true },
  { content: "B. hi／エラー", is_correct: false },
  { content: "C. エラー／hi", is_correct: false },
  { content: "D. エラー／エラー", is_correct: false }
])

# ==============================================================================
# 108. 文字列変換 / to_i
# ==============================================================================
question108 = Question.create!(
  content: "str = \"123abc\"\nnum = str.to_i\nputs num\nputs num + 5\nこのコードを実行すると何が出力されますか？（各行）",
  explanation: "\"123abc\".to_i は先頭から数値として解釈できる部分 123 を変換し、残りは無視して 123。その後 123 + 5 = 128。",
  category: "文字列変換 / to_i"
)
question108.choices.create!([
  { content: "A. 123／128", is_correct: true },
  { content: "B. 123abc／128abc", is_correct: false },
  { content: "C. 0／5", is_correct: false },
  { content: "D. 123／5", is_correct: false }
])

# ==============================================================================
# 109. 例外処理 / ensure
# ==============================================================================
question109 = Question.create!(
  content: "def foo\n  begin\n    raise \"oops\"\n  rescue => e\n    puts \"rescued: \#{e.message}\"\n    return \"from rescue\"\n  ensure\n    puts \"in ensure\"\n  end\nend\n\nputs foo\nこのコードの出力は？",
  explanation: "例外が発生 → rescue 節が実行されて \"rescued: oops\" 出力／return \"from rescue\" でメソッドからの戻り値を設定、その後必ず ensure 節実行で \"in ensure\" 出力。最後に foo の戻り値 \"from rescue\" を puts で出力。",
  category: "例外処理 / ensure"
)
question109.choices.create!([
  { content: "A. rescued: oops／in ensure／from rescue", is_correct: true },
  { content: "B. rescued: oops／in ensure／nil", is_correct: false },
  { content: "C. in ensure／from rescue", is_correct: false },
  { content: "D. rescued: oops／from rescue", is_correct: false }
])

# ==============================================================================
# 110. autoload / defined?
# ==============================================================================
question110 = Question.create!(
  content: "module A\n  autoload :B, \"a/b\"\nend\n\nputs defined?(A::B)\nもし \"a/b.rb\" が存在しない場合、defined?(A::B) の返り値は何になりますか？",
  explanation: "autoload :B, \"a/b\" を設定している限り、定数 A::B がまだロードされていない状態では、Ruby において defined? は \"autoload\" を返す。実際にファイルがロードされた後であれば \"constant\" や \"module\" 等となる。",
  category: "autoload / defined?"
)
question110.choices.create!([
  { content: "A. \"constant\"", is_correct: false },
  { content: "B. nil", is_correct: false },
  { content: "C. \"autoload\"", is_correct: true },
  { content: "D. \"module\"", is_correct: false }
])

# ==============================================================================
# 111. ブロック内変数参照
# ==============================================================================
question111 = Question.create!(
  content: "x = 10\n\n3.times do\n  x = x + 1\nend\n\nputs x\n出力は？",
  explanation: "ブロック内から外側のローカル変数 x を参照・更新できるため、3回インクリメント → 13。",
  category: "ブロック内変数参照"
)
question111.choices.create!([
  { content: "A. 10", is_correct: false },
  { content: "B. 11", is_correct: false },
  { content: "C. 13", is_correct: true },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 112. ハッシュのデフォルト値
# ==============================================================================
question112 = Question.create!(
  content: "h = Hash.new(0)\nh[:a] += 5\nputs h[:b]\n出力は？",
  explanation: "Hash.new(0) なので存在しないキーは 0 を返す。",
  category: "ハッシュのデフォルト値"
)
question112.choices.create!([
  { content: "A. nil", is_correct: false },
  { content: "B. 0", is_correct: true },
  { content: "C. 5", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 113. freeze / 破壊的メソッド
# ==============================================================================
question113 = Question.create!(
  content: "str = \"abc\".freeze\nstr << \"d\"\n何が起こる？",
  explanation: "freeze されたオブジェクトは破壊的操作 (<<) ができないため FrozenError。",
  category: "freeze / 破壊的メソッド"
)
question113.choices.create!([
  { content: "A. \"abcd\" が生成される", is_correct: false },
  { content: "B. \"abcd\" と表示", is_correct: false },
  { content: "C. 例外が発生する", is_correct: true },
  { content: "D. 無視される", is_correct: false }
])

# ==============================================================================
# 114. while 修飾子
# ==============================================================================
question114 = Question.create!(
  content: "x = 0\nputs x += 1 while x < 3\n出力は？",
  explanation: "puts (x += 1) が先、while x < 3 が後。xが1, 2, 3のときにそれぞれ puts が実行され、最後に x=3 となるため、3まで出力されます。",
  category: "while 修飾子"
)
question114.choices.create!([
  { content: "A. 1 2 3", is_correct: true },
  { content: "B. 1 2", is_correct: false },
  { content: "C. 1", is_correct: false },
  { content: "D. 何も出力されない", is_correct: false }
])

# ==============================================================================
# 115. each の戻り値
# ==============================================================================
question115 = Question.create!(
  content: "arr = [1,2,3]\nres = arr.each { |n| n * 10 }\np res\nres は？",
  explanation: "each は元の配列を返す。要素の計算結果は破棄。",
  category: "each の戻り値"
)
question115.choices.create!([
  { content: "A. [10,20,30]", is_correct: false },
  { content: "B. [1,2,3]", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. Enumerator", is_correct: false }
])

# ==============================================================================
# 116. クラス再オープン
# ==============================================================================
question116 = Question.create!(
  content: "class A\n  def x; 1 end\nend\n\nclass A\n  def y; 2 end\nend\n\nputs A.new.x + A.new.y\n出力は？",
  explanation: "Ruby ではクラスは再オープンできるため x=1, y=2 が両方使える。1 + 2 = 3。",
  category: "クラス再オープン"
)
question116.choices.create!([
  { content: "A. 1", is_correct: false },
  { content: "B. 2", is_correct: false },
  { content: "C. 3", is_correct: true },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 117. case / when
# ==============================================================================
question117 = Question.create!(
  content: "case 5\nwhen 1..10\n  puts \"ok\"\nelse\n  puts \"ng\"\nend\n出力は？",
  explanation: "case の比較は when_value === case_value で、(1..10) === 5 は真。",
  category: "case / when"
)
question117.choices.create!([
  { content: "A. ok", is_correct: true },
  { content: "B. ng", is_correct: false },
  { content: "C. エラー", is_correct: false },
  { content: "D. 何も出ない", is_correct: false }
])

# ==============================================================================
# 118. 例外再スロー
# ==============================================================================
question118 = Question.create!(
  content: "begin\n  raise \"err\"\nrescue => e\n  raise\nend\nこのコードの動作は？",
  explanation: "raise（引数なし）でキャッチした例外を再スロー。",
  category: "例外再スロー"
)
question118.choices.create!([
  { content: "A. 例外が握りつぶされる", is_correct: false },
  { content: "B. rescue の中で停止", is_correct: false },
  { content: "C. 再度例外が投げられる", is_correct: true },
  { content: "D. \"err\" が文字列として返る", is_correct: false }
])

# ==============================================================================
# 119. super（引数自動渡し）
# ==============================================================================
question119 = Question.create!(
  content: "class A\n  def hello(x)\n    x * 2\n  end\nend\n\nclass B < A\n  def hello(x)\n    super\n  end\nend\n\nputs B.new.hello(5)\n出力は？",
  explanation: "super だけなら「同じ引数をそのまま渡す」。Parent#hello(5) が呼ばれ 5 * 2 = 10。",
  category: "super（引数自動渡し"
)
question119.choices.create!([
  { content: "A. 5", is_correct: false },
  { content: "B. 10", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 120. 正規表現キャプチャ
# ==============================================================================
question120 = Question.create!(
  content: "if \"abc123\" =~ /([a-z]+)([0-9]+)/\n  puts $1\nend\n出力は？",
  explanation: "$1 は最初のキャプチャ → [a-z]+ → \"abc\"。",
  category: "正規表現キャプチャ"
)
question120.choices.create!([
  { content: "A. abc123", is_correct: false },
  { content: "B. abc", is_correct: true },
  { content: "C. 123", is_correct: false },
  { content: "D. nil", is_correct: false }
])

# ==============================================================================
# 121. puts の戻り値
# ==============================================================================
question121 = Question.create!(
  content: "v = puts \"hi\"\np v\n出力は？",
  explanation: "puts \"hi\" は \"hi\" を表示し、戻り値は nil。p v で nil が表示されます。",
  category: "puts の戻り値"
)
question121.choices.create!([
  { content: "A. \"hi\"", is_correct: false },
  { content: "B. nil", is_correct: false },
  { content: "C. \"hi\" と nil", is_correct: true },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 122. 配列ソート
# ==============================================================================
question122 = Question.create!(
  content: "arr = [\"b\", \"aa\", \"a\"]\np arr.sort\n結果は？",
  explanation: "文字列の辞書順。短さは関係なく \"a\" → \"aa\" → \"b\"。",
  category: "配列ソート"
)
question122.choices.create!([
  { content: "A. [\"a\",\"aa\",\"b\"]", is_correct: true },
  { content: "B. [\"aa\",\"a\",\"b\"]", is_correct: false },
  { content: "C. [\"b\",\"aa\",\"a\"]", is_correct: false },
  { content: "D. [\"a\",\"b\",\"aa\"]", is_correct: false }
])

# ==============================================================================
# 123. Time クラス
# ==============================================================================
question123 = Question.create!(
  content: "t = Time.new(2024, 1, 1)\nputs t.year\n出力は？",
  explanation: "Time#year は整数を返す。",
  category: "Time クラス"
)
question123.choices.create!([
  { content: "A. \"2024\"", is_correct: false },
  { content: "B. 2024", is_correct: true },
  { content: "C. 0", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 124. module_function
# ==============================================================================
question124 = Question.create!(
  content: "module M\n  def a; \"A\"; end\n  module_function :a\nend\n\nputs M.a\nputs M.new.a\n出力は？",
  explanation: "module_function は M.a をモジュール関数として公開し、M#a を private なインスタンスメソッドにするため、M.new.a はエラーになります。",
  category: "module_function"
)
question124.choices.create!([
  { content: "A. A / A", is_correct: false },
  { content: "B. A / エラー", is_correct: true },
  { content: "C. エラー / A", is_correct: false },
  { content: "D. エラー / エラー", is_correct: false }
])

# ==============================================================================
# 125. ブロック引数 / each
# ==============================================================================
question125 = Question.create!(
  content: "[1,2,3].each do |x, y|\n  p y\nend\n出力は？",
  explanation: "each のブロックには 1つの要素が渡される。x=要素, y=nil となるため、nil が3回出力されます。",
  category: "ブロック引数 / each"
)
question125.choices.create!([
  { content: "A. 1 2 3", is_correct: false },
  { content: "B. nil nil nil", is_correct: true },
  { content: "C. [1,2,3]", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 126. 定数 / 変数
# ==============================================================================
question126 = Question.create!(
  content: "A = 1\nA = 2\nRuby の動作として正しいものは？",
  explanation: "「定数の再代入」警告が出るが実行は継続し値は更新されます。",
  category: "定数 / 変数"
)
question126.choices.create!([
  { content: "A. 1 に固定されエラー", is_correct: false },
  { content: "B. 2 に更新され警告が出る", is_correct: true },
  { content: "C. 2 に更新され警告なし", is_correct: false },
  { content: "D. エラーで停止", is_correct: false }
])

# ==============================================================================
# 127. 数値演算 / 型
# ==============================================================================
question127 = Question.create!(
  content: "p 1 / 2.0\n出力は？",
  explanation: "Integer と Float の演算は Float になる。1 / 2.0 = 0.5。",
  category: "数値演算 / 型"
)
question127.choices.create!([
  { content: "A. 0", is_correct: false },
  { content: "B. 0.5", is_correct: true },
  { content: "C. 1", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 128. ファイル操作 / require
# ==============================================================================
question128 = Question.create!(
  content: "# main.rb と同じフォルダに util.rb がある場合\nrequire_relative \"util\"\n正しい説明は？",
  explanation: "require_relative は呼び出し元ファイル（ここでは main.rb）からの相対パスでファイルを探索します。",
  category: "ファイル操作 / require"
)
question128.choices.create!([
  { content: "A. カレントディレクトリから探索", is_correct: false },
  { content: "B. $LOAD_PATH から探索", is_correct: false },
  { content: "C. main.rb と同じディレクトリから探索", is_correct: true },
  { content: "D. 絶対パスが必要", is_correct: false }
])

# ==============================================================================
# 129. Symbol / オブジェクトの同一性
# ==============================================================================
question129 = Question.create!(
  content: "次のうち正しいものは？",
  explanation: "Symbol はイミュータブル（不変）かつ内部で重複しない性質を持ちます。そのため、同じ内容の Symbol は常に同一のオブジェクトです。",
  category: "Symbol / オブジェクトの同一性"
)
question129.choices.create!([
  { content: "A. Symbol はミュータブル", is_correct: false },
  { content: "B. 同じ内容の Symbol は同一オブジェクト", is_correct: true },
  { content: "C. \"abc\".to_sym を呼ぶたびに新しい Symbol が生成される", is_correct: false },
  { content: "D. Symbol はガーベジコレクションされる", is_correct: false }
])

# ==============================================================================
# 130. Fiber / 並行処理
# ==============================================================================
question130 = Question.create!(
  content: "f = Fiber.new { Fiber.yield 1; 2 }\np f.resume\np f.resume\n出力は？",
  explanation: "1回目の resume で Fiber.yield 1 が実行され 1 を返す。2回目の resume で次の 2 が実行され 2 を返す。",
  category: "Fiber / 並行処理"
)
question130.choices.create!([
  { content: "A. 1 / 2", is_correct: true },
  { content: "B. 2 / 1", is_correct: false },
  { content: "C. 1 / nil", is_correct: false },
  { content: "D. nil / 2", is_correct: false }
])

# ==============================================================================
# 131. 制御構造 / 繰り返し
# ==============================================================================
question131 = Question.create!(
  content: "x = 0\nuntil x > 2\n  x += 1\nend\nputs x\n出力は？",
  explanation: "x が 0, 1, 2 の時にループが実行され、x は 1, 2, 3 と変化します。x=3 で条件 x > 2 が真になりループを抜けるため、3が出力されます。",
  category: "制御構造 / 繰り返し"
)
question131.choices.create!([
  { content: "A. 0", is_correct: false },
  { content: "B. 1", is_correct: false },
  { content: "C. 2", is_correct: false },
  { content: "D. 3", is_correct: true }
])

# ==============================================================================
# 132. メソッド / デフォルト引数
# ==============================================================================
question132 = Question.create!(
  content: "def add(x, y = x)\n  x + y\nend\n\np add(5)\n出力は？",
  explanation: "デフォルト引数 y = x はメソッド呼び出し時に評価される。x=5 なので yも5となり、5 + 5 = 10。",
  category: "メソッド / デフォルト引数"
)
question132.choices.create!([
  { content: "A. 5", is_correct: false },
  { content: "B. 10", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 133. Array / 配列操作
# ==============================================================================
question133 = Question.create!(
  content: "p [1,2,3].zip([4,5])\n結果は？",
  explanation: "zip は対応する要素をペアにし、短い配列に合わせて余った側には nil を詰めます。",
  category: "Array / 配列操作"
)
question133.choices.create!([
  { content: "A. [[1,4],[2,5],[3,nil]]", is_correct: true },
  { content: "B. [[1,4],[2,5]]", is_correct: false },
  { content: "C. [[1,4,nil],[2,5,nil],[3,nil,nil]]", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 134. Struct / データ構造
# ==============================================================================
question134 = Question.create!(
  content: "S = Struct.new(:a, :b)\ns = S.new(1,2)\nputs s.a + s.b\n出力は？",
  explanation: "Struct のインスタンス s は、a=1, b=2 のメンバを持ち、1 + 2 = 3。",
  category: "Struct / データ構造"
)
question134.choices.create!([
  { content: "A. 1", is_correct: false },
  { content: "B. 2", is_correct: false },
  { content: "C. 3", is_correct: true },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 135. 例外処理 / rescue
# ==============================================================================
question135 = Question.create!(
  content: "def foo\n  raise \"x\"\nrescue\n    \"r\"\nend\n\nputs foo\n出力は？",
  explanation: "メソッド定義内は begin/end 省略で暗黙の begin があり、raise が発生しても rescue 節でキャッチされ、その戻り値 \"r\" がメソッドの戻り値となります。",
  category: "例外処理 / rescue"
)
question135.choices.create!([
  { content: "A. x", is_correct: false },
  { content: "B. r", is_correct: true },
  { content: "C. エラー", is_correct: false },
  { content: "D. nil", is_correct: false }
])

# ==============================================================================
# 136. 制御構造 / 条件分岐
# ==============================================================================
question136 = Question.create!(
  content: "x = 5\n\nif x < 3\n  puts 1\nelsif x < 10\n  puts 2\nelse\n  puts 3\nend\n出力は？",
  explanation: "x=5 は最初の if (x < 3) は偽、次の elsif (x < 10) は真なので 2 が出力されます。",
  category: "制御構造 / 条件分岐"
)
question136.choices.create!([
  { content: "A. 1", is_correct: false },
  { content: "B. 2", is_correct: true },
  { content: "C. 3", is_correct: false },
  { content: "D. 何も出力されない", is_correct: false }
])

# ==============================================================================
# 137. Array / 破壊的メソッド
# ==============================================================================
question137 = Question.create!(
  content: "arr = [1,2,3]\narr.reverse\np arr\n出力は？",
  explanation: "reverse は非破壊メソッドなので、元の配列 arr は変更されず [1,2,3] のままです。破壊版は reverse! です。",
  category: "Array / 破壊的メソッド"
)
question137.choices.create!([
  { content: "A. [3,2,1]", is_correct: false },
  { content: "B. [1,2,3]", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 138. nil / 真偽値
# ==============================================================================
question138 = Question.create!(
  content: "puts \"\".nil?\n出力は？",
  explanation: "空文字 \"\" はオブジェクトであり nil ではないため false です。",
  category: "nil / 真偽値"
)
question138.choices.create!([
  { content: "A. true", is_correct: false },
  { content: "B. false", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 139. Symbol / 比較
# ==============================================================================
question139 = Question.create!(
  content: "p :a == \"a\"\n出力は？",
  explanation: "シンボル :a と文字列 \"a\" は異なる型なので比較結果は false です。",
  category: "Symbol / 比較"
)
question139.choices.create!([
  { content: "A. true", is_correct: false },
  { content: "B. false", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 140. Hash / merge
# ==============================================================================
question140 = Question.create!(
  content: "h1 = {a: 1, b: 2}\nh2 = {b: 3, c: 4}\n\np h1.merge(h2)\n出力は？",
  explanation: "merge は Hash を結合し、キーが重複する場合は引数（h2）の値で上書きされます。",
  category: "Hash / merge"
)
question140.choices.create!([
  { content: "A. {:a=>1, :b=>2, :c=>4}", is_correct: false },
  { content: "B. {:a=>1, :b=>3, :c=>4}", is_correct: true },
  { content: "C. {:b=>3}", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 141. Enumerable / each_with_index
# ==============================================================================
question141 = Question.create!(
  content: "res = []\n[\"a\",\"b\"].each_with_index { |v,i| res << [v,i] }\np res\n出力は？",
  explanation: "each_with_index は要素とそのインデックス（0から始まる）をブロックに渡します。",
  category: "Enumerable / each_with_index"
)
question141.choices.create!([
  { content: "A. [[\"a\",1],[\"b\",2]]", is_correct: false },
  { content: "B. [[\"a\",0],[\"b\",1]]", is_correct: true },
  { content: "C. [1,2]", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 142. メソッド / デフォルト引数
# ==============================================================================
question142 = Question.create!(
  content: "def f(a, b=2, c=3)\n  a + b + c\nend\n\np f(1, 10)\n出力は？",
  explanation: "f(1, 10) は a=1, b=10, c=3 と解釈され、1 + 10 + 3 = 14 です。",
  category: "メソッド / デフォルト引数"
)
question142.choices.create!([
  { content: "A. 3", is_correct: false },
  { content: "B. 13", is_correct: false },
  { content: "C. 14", is_correct: true },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 143. Integer / times
# ==============================================================================
question143 = Question.create!(
  content: "v = 3.times { }\np v\n出力は？",
  explanation: "times の戻り値はレシーバ（ここでは 3）です。",
  category: "Integer / times"
)
question143.choices.create!([
  { content: "A. [0,1,2]", is_correct: false },
  { content: "B. 3", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 144. 制御構造 / 繰り返し
# ==============================================================================
question144 = Question.create!(
  content: "x = 0\nx += 1 until x == 3\nputs x\n出力は？",
  explanation: "x が 3 になるまで x += 1 が実行されます。x=0, 1, 2 の時に実行され、x は最終的に 3 になります。",
  category: "制御構造 / 繰り返し"
)
question144.choices.create!([
  { content: "A. 1", is_correct: false },
  { content: "B. 2", is_correct: false },
  { content: "C. 3", is_correct: true },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 145. Array / 演算子
# ==============================================================================
question145 = Question.create!(
  content: "p [1,2] + [3,4]\n出力は？",
  explanation: "配列の + 演算子は配列を結合します。",
  category: "Array / 演算子"
)
question145.choices.create!([
  { content: "A. [1,2,3,4]", is_correct: true },
  { content: "B. [1,[3,4]]", is_correct: false },
  { content: "C. [3,4,1,2]", is_correct: false },
  { content: "D. nil", is_correct: false }
])

# ==============================================================================
# 146. 制御構造 / break
# ==============================================================================
question146 = Question.create!(
  content: "v = while true\n  break 10\nend\n\np v\n出力は？",
  explanation: "while 文などのループ構造が break された場合、break の引数（ここでは 10）がループ全体の戻り値となります。",
  category: "制御構造 / break"
)
question146.choices.create!([
  { content: "A. nil", is_correct: false },
  { content: "B. 10", is_correct: true },
  { content: "C. true", is_correct: false },
  { content: "D. false", is_correct: false }
])

# ==============================================================================
# 147. Hash / キー操作
# ==============================================================================
question147 = Question.create!(
  content: "h = {a: 1, b: 2}\np h.keys\n出力は？",
  explanation: "h.keys はハッシュのキーを配列として返します。キーはシンボルです。",
  category: "Hash / キー操作"
)
question147.choices.create!([
  { content: "A. [:a, :b]", is_correct: true },
  { content: "B. [\"a\",\"b\"]", is_correct: false },
  { content: "C. [1,2]", is_correct: false },
  { content: "D. nil", is_correct: false }
])

# ==============================================================================
# 148. クラス / private メソッド
# ==============================================================================
question148 = Question.create!(
  content: "class C\n  private\n  def x; 1; end\nend\n\np C.new.x\nどうなる？",
  explanation: "private メソッドはレシーバ付きで呼び出すことができないため、NoMethodError となりエラーになります。",
  category: "クラス / private メソッド"
)
question148.choices.create!([
  { content: "A. 1", is_correct: false },
  { content: "B. nil", is_correct: false },
  { content: "C. エラー", is_correct: true },
  { content: "D. \"x\"", is_correct: false }
])

# ==============================================================================
# 149. クラスメソッド
# ==============================================================================
question149 = Question.create!(
  content: "class A\n  def self.x\n    1\n  end\nend\n\np A.x\n出力は？",
  explanation: "def self.x はクラスメソッドの定義であり、クラス A から直接呼び出すことができます。",
  category: "クラスメソッド"
)
question149.choices.create!([
  { content: "A. 1", is_correct: true },
  { content: "B. nil", is_correct: false },
  { content: "C. エラー", is_correct: false },
  { content: "D. \"x\"", is_correct: false }
])

# ==============================================================================
# 150. Object / tap
# ==============================================================================
question150 = Question.create!(
  content: "p (5.tap { |v| puts v * 2 })\n出力は？",
  explanation: "tap はレシーバ（5）をブロックに渡し、ブロックの処理（puts 10）を行った後、レシーバ自身（5）を返します。puts 10が先に実行され、その後 p 5 が実行されます。",
  category: "Object / tap"
)
question150.choices.create!([
  { content: "A. 10 に続き 5", is_correct: true },
  { content: "B. 5 に続き 10", is_correct: false },
  { content: "C. 10", is_correct: false },
  { content: "D. 5", is_correct: false }
])
# ==============================================================================
# 151. Range / to_a
# ==============================================================================
question151 = Question.create!(
  content: "p ('a'..'c').to_a\n出力は？",
  category: "Range / to_a"
)
question151.choices.create!([
  { content: "A. [\"a\",\"b\",\"c\"]", is_correct: true },
  { content: "B. [\"a\",\"c\"]", is_correct: false },
  { content: "C. [[\"a\",\"b\"],\"c\"]", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 152. メソッド / キーワード引数
# ==============================================================================
question152 = Question.create!(
  content: "def f(**h)\n  h\nend\n\np f(a: 1, b: 2)\n出力は？",
  category: "メソッド / キーワード引数"
)
question152.choices.create!([
  { content: "A. [:a, :b]", is_correct: false },
  { content: "B. {:a=>1, :b=>2}", is_correct: true },
  { content: "C. [{\"a\"=>1,\"b\"=>2}]", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 153. lambda / 引数の厳格性
# ==============================================================================
question153 = Question.create!(
  content: "l = ->(x) { x }\np l.call(1, 2)\nどうなる？",
  explanation: "lambda は引数の数に厳格なため、引数が多すぎると ArgumentError。",
  category: "lambda / 引数の厳格性"
)
question153.choices.create!([
  { content: "A. 1", is_correct: false },
  { content: "B. [1,2]", is_correct: false },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: true }
])

# ==============================================================================
# 154. Proc / 引数の緩やかさ
# ==============================================================================
question154 = Question.create!(
  content: "p = Proc.new { |x| x }\np p.call(1,2)\n出力は？",
  explanation: "Proc は余分な引数を無視し、最初の引数 `1` のみをブロック変数 `x` に渡し、その結果を返します。",
  category: "Proc / 引数の緩やかさ"
)
question154.choices.create!([
  { content: "A. 1", is_correct: true },
  { content: "B. [1,2]", is_correct: false },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 155. Array / compact
# ==============================================================================
question155 = Question.create!(
  content: "p [1,nil,2,nil].compact\n出力は？",
  category: "Array / compact"
)
question155.choices.create!([
  { content: "A. [1,nil,2,nil]", is_correct: false },
  { content: "B. [1,2]", is_correct: true },
  { content: "C. [nil,nil]", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 156. Enumerable / Enumerator
# ==============================================================================
question156 = Question.create!(
  content: "e = [1,2,3].map\np e.class\n出力は？",
  explanation: "ブロックなしで map を呼ぶと Enumerator を返します。",
  category: "Enumerable / Enumerator"
)
question156.choices.create!([
  { content: "A. Array", is_correct: false },
  { content: "B. Enumerator", is_correct: true },
  { content: "C. Proc", is_correct: false },
  { content: "D. nil", is_correct: false }
])

# ==============================================================================
# 157. クラス変数 / 継承
# ==============================================================================
question157 = Question.create!(
  content: "class A\n  @@x = 1\nend\n\nclass B < A\n  @@x = 5\nend\n\np A.class_variable_get(:@@x)\n出力は？",
  explanation: "クラス変数はクラス階層全体で共有されるため、B で変更すると A も変更されます。",
  category: "クラス変数 / 継承"
)
question157.choices.create!([
  { content: "A. 1", is_correct: false },
  { content: "B. 5", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 158. Array / %w
# ==============================================================================
question158 = Question.create!(
  content: "p %w(a b c)\n出力は？",
  category: "Array / %w"
)
question158.choices.create!([
  { content: "A. [\"a\",\"b\",\"c\"]", is_correct: true },
  { content: "B. [:a,:b,:c]", is_correct: false },
  { content: "C. [\"a b c\"]", is_correct: false },
  { content: "D. [\"%w\",\"a\",\"b\",\"c\"]", is_correct: false }
])

# ==============================================================================
# 159. String / split
# ==============================================================================
question159 = Question.create!(
  content: "p \"a,b,c\".split(\",\")\n出力は？",
  category: "String / split"
)
question159.choices.create!([
  { content: "A. \"a,b,c\"", is_correct: false },
  { content: "B. [\"a,b,c\"]", is_correct: false },
  { content: "C. [\"a\",\"b\",\"c\"]", is_correct: true },
  { content: "D. [\"a\",\",\",\"b\",\",\",\"c\"]", is_correct: false }
])

# ==============================================================================
# 160. Hash / 順序
# ==============================================================================
question160 = Question.create!(
  content: "h = {b: 2, a: 1}\np h.to_a\n出力は？",
  explanation: "RubyのHashは挿入順序を保持し、to_a は [キー, 値] の配列を挿入順に格納した配列を返します。",
  category: "Hash / 順序"
)
question160.choices.create!([
  { content: "A. [[:b,2],[:a,1]]", is_correct: true },
  { content: "B. [[:a,1],[:b,2]]", is_correct: false },
  { content: "C. ソートされて出力", is_correct: false },
  { content: "D. ランダム", is_correct: false }
])

# ==============================================================================
# 161. オブジェクトの同一性 / equal?
# ==============================================================================
question161 = Question.create!(
  content: "a = \"x\"\nb = \"x\"\np a.equal?(b)\n出力は？",
  explanation: "equal? は同一オブジェクトかどうかをチェックします。異なる場所で作成された同じ内容の文字列は、異なるオブジェクトです。",
  category: "オブジェクトの同一性 / equal?"
)
question161.choices.create!([
  { content: "A. true", is_correct: false },
  { content: "B. false", is_correct: true },
  { content: "C. \"x\"", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 162. String / 演算子
# ==============================================================================
question162 = Question.create!(
  content: "s = \"a\"\ns += \"b\"\np s\n出力は？",
  explanation: "RubyのStringの+=演算子は、通常、レシーバの文字列を破壊的に変更するのではなく、新しい文字列オブジェクトを生成し、それを変数に再代入します（ただし、内部的には最適化されることもあります）。結果として文字列が結合されます。",
  category: "String / 演算子"
)
question162.choices.create!([
  { content: "A. \"a\"", is_correct: false },
  { content: "B. \"ab\"", is_correct: true },
  { content: "C. [\"a\",\"b\"]", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 163. Integer / upto
# ==============================================================================
question163 = Question.create!(
  content: "res = []\n1.upto(3) { |n| res << n }\np res\n出力は？",
  category: "Integer / upto"
)
question163.choices.create!([
  { content: "A. [3,2,1]", is_correct: false },
  { content: "B. [1,2,3]", is_correct: true },
  { content: "C. [2,3]", is_correct: false },
  { content: "D. nil", is_correct: false }
])

# ==============================================================================
# 164. Enumerable / reduce
# ==============================================================================
question164 = Question.create!(
  content: "p [1,2,3].reduce(10) { |sum, n| sum + n }\n出力は？",
  explanation: "初期値 10 に配列の要素 (1, 2, 3) が順番に足されます。10 + 1 + 2 + 3 = 16。",
  category: "Enumerable / reduce"
)
question164.choices.create!([
  { content: "A. 6", is_correct: false },
  { content: "B. 13", is_correct: false },
  { content: "C. 16", is_correct: true },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 165. 例外処理 / rescue
# ==============================================================================
question165 = Question.create!(
  content: "begin\n  raise ArgumentError\nrescue RuntimeError, ArgumentError\n  puts \"caught\"\nend\n出力は？",
  explanation: "ArgumentError は rescue 節で指定されているため捕捉され、'caught' が出力されます。",
  category: "例外処理 / rescue"
)
question165.choices.create!([
  { content: "A. 何も出ない", is_correct: false },
  { content: "B. caught", is_correct: true },
  { content: "C. エラー", is_correct: false },
  { content: "D. ArgumentError", is_correct: false }
])

# ==============================================================================
# 166. String / 破壊的メソッド
# ==============================================================================
question166 = Question.create!(
  content: "s = \"abc\"\np s.upcase!\np s\n出力は？",
  category: "String / 破壊的メソッド"
)
question166.choices.create!([
  { content: "A. \"ABC\" / \"ABC\"", is_correct: true },
  { content: "B. \"abc\" / \"abc\"", is_correct: false },
  { content: "C. nil / \"abc\"", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 167. Object / respond_to?
# ==============================================================================
question167 = Question.create!(
  content: "p \"hi\".respond_to?(:upcase)\n出力は？",
  category: "Object / respond_to?"
)
question167.choices.create!([
  { content: "A. true", is_correct: true },
  { content: "B. false", is_correct: false },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 168. Proc / 比較
# ==============================================================================
question168 = Question.create!(
  content: "p Proc.new {} == Proc.new {}\n出力は？",
  explanation: "Proc の == は同一のオブジェクトに対してのみ true を返します。Proc.new {} は毎回新しいオブジェクトを生成します。",
  category: "Proc / 比較"
)
question168.choices.create!([
  { content: "A. true", is_correct: false },
  { content: "B. false", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 169. Range / include?
# ==============================================================================
question169 = Question.create!(
  content: "p (1...5).include?(5)\n出力は？",
  explanation: "1...5 は終端（5）を含まない排他的範囲です。",
  category: "Range / include?"
)
question169.choices.create!([
  { content: "A. true", is_correct: false },
  { content: "B. false", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 170. 制御構造 / until
# ==============================================================================
question170 = Question.create!(
  content: "x = 5\nuntil x < 3\n  x -= 1\nend\n\np x\n出力は？",
  category: "制御構造 / until"
)
question170.choices.create!([
  { content: "A. 5", is_correct: false },
  { content: "B. 3", is_correct: false },
  { content: "C. 2", is_correct: true },
  { content: "D. 0", is_correct: false }
])

# ==============================================================================
# 171. Proc / return
# ==============================================================================
question171 = Question.create!(
  content: "def test\n  p = proc { return 1 }\n  p.call\n  return 2\nend\n\np test\n出力は？",
  explanation: "Proc 内の return は、Proc が定義されたメソッド（test）からの脱出を試みるため、`return 1` でメソッド全体が終了します。",
  category: "Proc / return"
)
question171.choices.create!([
  { content: "A. 1", is_correct: true },
  { content: "B. 2", is_correct: false },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 172. lambda / return
# ==============================================================================
question172 = Question.create!(
  content: "def test\n  l = -> { return 1 }\n  l.call\n  return 2\nend\n\np test\n出力は？",
  explanation: "lambda 内の return は、lambda 自体からの脱出を試みるため、メソッド（test）は継続し、最後に `return 2` が実行されます。",
  category: "lambda / return"
)
question172.choices.create!([
  { content: "A. 1", is_correct: false },
  { content: "B. 2", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 173. 変数 / NameError
# ==============================================================================
question173 = Question.create!(
  content: "p x\nどうなる？",
  explanation: "変数 x が定義されていないため NameError となります。",
  category: "変数 / NameError"
)
question173.choices.create!([
  { content: "A. nil", is_correct: false },
  { content: "B. false", is_correct: false },
  { content: "C. 0", is_correct: false },
  { content: "D. NameError", is_correct: true }
])

# ==============================================================================
# 174. モジュール / include
# ==============================================================================
question174 = Question.create!(
  content: "module M\n  def hello; \"hi\"; end\nend\n\nclass A\n  include M\nend\n\np A.new.hello\n出力は？",
  category: "モジュール / include"
)
question174.choices.create!([
  { content: "A. エラー", is_correct: false },
  { content: "B. nil", is_correct: false },
  { content: "C. hi", is_correct: true },
  { content: "D. \"hello\"", is_correct: false }
])

# ==============================================================================
# 175. Array / to_h
# ==============================================================================
question175 = Question.create!(
  content: "p [[:a,1],[:b,2]].to_h\n出力は？",
  category: "Array / to_h"
)
question175.choices.create!([
  { content: "A. [:a,1,:b,2]", is_correct: false },
  { content: "B. {:a=>1, :b=>2}", is_correct: true },
  { content: "C. {\"a\"=>1,\"b\"=>2}", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 176. メソッド / 引数エラー
# ==============================================================================
question176 = Question.create!(
  content: "def f(a, b)\nend\n\nf(1)\nどうなる？",
  explanation: "メソッド f は引数を2つ要求しますが、1つしか渡されていないため ArgumentError となります。",
  category: "メソッド / 引数エラー"
)
question176.choices.create!([
  { content: "A. 実行される", is_correct: false },
  { content: "B. nil", is_correct: false },
  { content: "C. ArgumentError", is_correct: true },
  { content: "D. false", is_correct: false }
])

# ==============================================================================
# 177. Enumerable / each_slice
# ==============================================================================
question177 = Question.create!(
  content: "p [1,2,3,4].each_slice(2).to_a\n出力は？",
  category: "Enumerable / each_slice"
)
question177.choices.create!([
  { content: "A. [[1],[2],[3],[4]]", is_correct: false },
  { content: "B. [[1,2],[3,4]]", is_correct: true },
  { content: "C. [[1,2,3,4]]", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 178. Enumerable / map.with_index
# ==============================================================================
question178 = Question.create!(
  content: "p [\"a\",\"b\"].map.with_index { |v,i| [v,i] }\n出力は？",
  category: "Enumerable / map.with_index"
)
question178.choices.create!([
  { content: "A. [[\"a\",1],[\"b\",2]]", is_correct: false },
  { content: "B. [[\"a\",0],[\"b\",1]]", is_correct: true },
  { content: "C. [1,2]", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 179. 例外処理 / メッセージ
# ==============================================================================
question179 = Question.create!(
  content: "begin\n  raise \"error!\"\nrescue => e\n  p e.message\nend\n出力は？",
  category: "例外処理 / メッセージ"
)
question179.choices.create!([
  { content: "A. nil", is_correct: false },
  { content: "B. \"RuntimeError\"", is_correct: false },
  { content: "C. \"error!\"", is_correct: true },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 180. Hash / fetch
# ==============================================================================
question180 = Question.create!(
  content: "h = {a:1}\np h.fetch(:b, 5)\n出力は？",
  category: "Hash / fetch"
)
question180.choices.create!([
  { content: "A. nil", is_correct: false },
  { content: "B. 5", is_correct: true },
  { content: "C. 1", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 181. File / 存在確認
# ==============================================================================
question181 = Question.create!(
  content: "p File.exist?(\"no_such_file\")\n出力は？",
  category: "File / 存在確認"
)
question181.choices.create!([
  { content: "A. true", is_correct: false },
  { content: "B. false", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 182. Symbol / %i
# ==============================================================================
question182 = Question.create!(
  content: "p %i(a b c)\n出力は？",
  category: "Symbol / %i"
)
question182.choices.create!([
  { content: "A. [\"a\",\"b\",\"c\"]", is_correct: false },
  { content: "B. [:a,:b,:c]", is_correct: true },
  { content: "C. [a,b,c]", is_correct: false },
  { content: "D. [\"%i\",\"a\",\"b\",\"c\"]", is_correct: false }
])

# ==============================================================================
# 183. Array / delete
# ==============================================================================
question183 = Question.create!(
  content: "a = [1,2,3,2]\na.delete(2)\np a\n出力は？",
  explanation: "delete メソッドは、該当するすべての要素を削除し、最初に削除された要素を返します。配列 a は破壊的に変更されます。",
  category: "Array / delete"
)
question183.choices.create!([
  { content: "A. [1,3]", is_correct: true },
  { content: "B. [1,2,3]", is_correct: false },
  { content: "C. [1,3,2]", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 184. Enumerable / シンボルto_proc
# ==============================================================================
question184 = Question.create!(
  content: "p [1,2,3].map(&:to_s)\n出力は？",
  category: "Enumerable / シンボルto_proc"
)
question184.choices.create!([
  { content: "A. [\"1\",\"2\",\"3\"]", is_correct: true },
  { content: "B. [1,2,3]", is_correct: false },
  { content: "C. [\"to_s\"]", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 185. クラス / Integer
# ==============================================================================
question185 = Question.create!(
  content: "p 123.class\n出力は？",
  category: "クラス / Integer"
)
question185.choices.create!([
  { content: "A. Integer", is_correct: true },
  { content: "B. Fixnum", is_correct: false },
  { content: "C. Numeric", is_correct: false },
  { content: "D. Object", is_correct: false }
])

# ==============================================================================
# 186. クラス / super
# ==============================================================================
question186 = Question.create!(
  content: "class A\n  def f(x); x + 1; end\nend\n\nclass B < A\n  def f(x)\n    super(10)\n  end\nend\n\np B.new.f(5)\n出力は？",
  explanation: "B#f 内の super(10) は、親クラス A の A#f(10) を呼び出します。A#f は 10 + 1 を計算し、11 を返します。B#f の引数 5 は super 呼び出しでは使われません。",
  category: "クラス / super"
)
question186.choices.create!([
  { content: "A. 6", is_correct: false },
  { content: "B. 11", is_correct: true },
  { content: "C. 5", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 187. 定数 / スコープ
# ==============================================================================
question187 = Question.create!(
  content: "X = 1\n\nclass A\n  X = 2\n  def x\n    X\n  end\nend\n\np A.new.x\n出力は？",
  explanation: "定数はスコープのルールに従って解決されます。メソッド内で定数が参照される場合、そのメソッドが定義されたクラス (A) のスコープにある定数 (X=2) が優先されます。",
  category: "定数 / スコープ"
)
question187.choices.create!([
  { content: "A. 1", is_correct: false },
  { content: "B. 2", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 188. 制御構造 / case
# ==============================================================================
question188 = Question.create!(
  content: "x = 2\ncase x\nwhen 1, 2\n  puts \"ok\"\nelse\n  puts \"ng\"\nend\n出力は？",
  category: "制御構造 / case"
)
question188.choices.create!([
  { content: "A. ok", is_correct: true },
  { content: "B. ng", is_correct: false },
  { content: "C. 1", is_correct: false },
  { content: "D. 2", is_correct: false }
])

# ==============================================================================
# 189. Integer / step
# ==============================================================================
question189 = Question.create!(
  content: "res = []\n1.step(5, 2) { |n| res << n }\np res\n出力は？",
  category: "Integer / step"
)
question189.choices.create!([
  { content: "A. [1,2,3,4,5]", is_correct: false },
  { content: "B. [1,3,5]", is_correct: true },
  { content: "C. [2,4]", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 190. String / sub
# ==============================================================================
question190 = Question.create!(
  content: "p \"abcabc\".sub(\"a\", \"x\")\n出力は？",
  explanation: "sub は最初に見つかったパターンのみを置換します。",
  category: "String / sub"
)
question190.choices.create!([
  { content: "A. \"xbcabc\"", is_correct: true },
  { content: "B. \"abcxbc\"", is_correct: false },
  { content: "C. \"xxbcabc\"", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 191. String / gsub
# ==============================================================================
question191 = Question.create!(
  content: "p \"abcabc\".gsub(\"a\",\"x\")\n出力は？",
  explanation: "gsub は該当するすべてのパターンを置換します。",
  category: "String / gsub"
)
question191.choices.create!([
  { content: "A. \"xbcabc\"", is_correct: false },
  { content: "B. \"abcxbc\"", is_correct: false },
  { content: "C. \"xbcxbc\"", is_correct: true },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 192. String / each_char
# ==============================================================================
question192 = Question.create!(
  content: "res = []\n\"a1b\".each_char { |c| res << c }\np res\n出力は？",
  category: "String / each_char"
)
question192.choices.create!([
  { content: "A. [\"a1b\"]", is_correct: false },
  { content: "B. [\"a\",\"1\",\"b\"]", is_correct: true },
  { content: "C. [\"a\",\"b\"]", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 193. ファイル操作 / require
# ==============================================================================
question193 = Question.create!(
  content: "p require \"json\"\np require \"json\"\n2行目の出力は？",
  explanation: "require は、ライブラリが既にロード済みであれば false を返します。",
  category: "ファイル操作 / require"
)
question193.choices.create!([
  { content: "A. true", is_correct: false },
  { content: "B. false", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. \"json\"", is_correct: false }
])

# ==============================================================================
# 194. each の戻り値
# ==============================================================================
question194 = Question.create!(
  content: "p [1,2,3].each { |n| n * 2 }\n出力は？",
  explanation: "each メソッドは、ブロックの実行結果に関係なく、レシーバ自身（[1,2,3]）を返します。",
  category: "each の戻り値"
)
question194.choices.create!([
  { content: "A. [2,4,6]", is_correct: false },
  { content: "B. [1,2,3]", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 195. メソッド / 可変長引数
# ==============================================================================
question195 = Question.create!(
  content: "def f(*args)\n  args.size\nend\n\np f(1,2,3)\n出力は？",
  category: "メソッド / 可変長引数"
)
question195.choices.create!([
  { content: "A. 1", is_correct: false },
  { content: "B. 2", is_correct: false },
  { content: "C. 3", is_correct: true },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 196. ブロック引数 / each
# ==============================================================================
question196 = Question.create!(
  content: "[1,2].each { |a,b| p b }\n出力は？",
  explanation: "each は配列の各要素をブロックに渡します。`[1,2]` の最初の要素 `1` が `a` に、`b` には nil が渡されます。次に `2` が `a` に、`b` には nil が渡されます。したがって nil が2回出力されます。",
  category: "ブロック引数 / each"
)
question196.choices.create!([
  { content: "A. 1 2", is_correct: false },
  { content: "B. nil nil", is_correct: true },
  { content: "C. 0 0", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 197. メソッド / 再定義
# ==============================================================================
question197 = Question.create!(
  content: "def a; 1; end\ndef a; 2; end\np a\n出力は？",
  explanation: "Rubyではメソッドは再定義可能であり、最後に定義されたメソッドが有効になります。",
  category: "メソッド / 再定義"
)
question197.choices.create!([
  { content: "A. 1", is_correct: false },
  { content: "B. 2", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 198. Hash / シンボルキー
# ==============================================================================
question198 = Question.create!(
  content: "h = {}\nh[:a] = 10\np h\n出力は？",
  category: "Hash / シンボルキー"
)
question198.choices.create!([
  { content: "A. {\"a\"=>10}", is_correct: false },
  { content: "B. [:a,10]", is_correct: false },
  { content: "C. {:a=>10}", is_correct: true },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 199. Integer / downto
# ==============================================================================
question199 = Question.create!(
  content: "res = []\n5.downto(3) { |n| res << n }\np res\n出力は？",
  category: "Integer / downto"
)
question199.choices.create!([
  { content: "A. [5,4,3]", is_correct: true },
  { content: "B. [3,4,5]", is_correct: false },
  { content: "C. [5,3]", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 200. Hash / キー存在確認
# ==============================================================================
question200 = Question.create!(
  content: "h = {a:1}\np h.key?(:b)\n出力は？",
  category: "Hash / キー存在確認"
)
question200.choices.create!([
  { content: "A. true", is_correct: false },
  { content: "B. false", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 201. Array / unshift
# ==============================================================================
question201 = Question.create!(
  content: "a = [2,3]\na.unshift(1)\np a\n出力は？",
  category: "Array / unshift"
)
question201.choices.create!([
  { content: "A. [1,2,3]", is_correct: true },
  { content: "B. [2,3,1]", is_correct: false },
  { content: "C. [3,2,1]", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 202. Hash / delete_if
# ==============================================================================
question202 = Question.create!(
  content: "h = {a:1,b:2}\nh.delete_if { |k,v| v > 1 }\np h\n出力は？",
  category: "Hash / delete_if"
)
question202.choices.create!([
  { content: "A. {:a=>1}", is_correct: true },
  { content: "B. {:b=>2}", is_correct: false },
  { content: "C. {:a=>1,:b=>2}", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 203. Enumerable / map
# ==============================================================================
question203 = Question.create!(
  content: "v = [1,2,3].map { |n| n > 1 }\np v\n出力は？",
  category: "Enumerable / map"
)
question203.choices.create!([
  { content: "A. [false,true,true]", is_correct: true },
  { content: "B. [true,false,false]", is_correct: false },
  { content: "C. [1,2,3]", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 204. Array / 破壊的メソッド
# ==============================================================================
question204 = Question.create!(
  content: "arr = [1,2]\narr.map! { |n| n * 10 }\np arr\n出力は？",
  category: "Array / 破壊的メソッド"
)
question204.choices.create!([
  { content: "A. [1,2]", is_correct: false },
  { content: "B. [10,20]", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 205. モジュール / module_function
# ==============================================================================
question205 = Question.create!(
  content: "module M\n  def f; 1; end\n  module_function :f\nend\n\np M.f\n出力は？",
  explanation: "module_function は、指定されたインスタンスメソッドをモジュールの特異メソッド（クラスメソッド）としても利用可能にします。",
  category: "モジュール / module_function"
)
question205.choices.create!([
  { content: "A. 1", is_correct: true },
  { content: "B. nil", is_correct: false },
  { content: "C. エラー", is_correct: false },
  { content: "D. \"f\"", is_correct: false }
])

# ==============================================================================
# 206. 制御構造 / for / スコープ
# ==============================================================================
question206 = Question.create!(
  content: "for x in [1,2]; end\np x\n出力は？",
  explanation: "for はブロックスコープを作らないため、ループが終了した後も変数 x は存在し、最後に代入された値 2 を保持しています。",
  category: "制御構造 / for / スコープ"
)
question206.choices.create!([
  { content: "A. 1", is_correct: false },
  { content: "B. 2", is_correct: true },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 207. クラス変数 / インスタンス変数
# ==============================================================================
question207 = Question.create!(
  content: "class A\n  @x = 10\n  def self.x; @x; end\nend\n\np A.x\n出力は？",
  explanation: "`@x` はクラス A の**クラスインスタンス変数**であり、A.x はそれを返します。",
  category: "クラス変数 / インスタンス変数"
)
question207.choices.create!([
  { content: "A. 10", is_correct: true },
  { content: "B. nil", is_correct: false },
  { content: "C. エラー", is_correct: false },
  { content: "D. 0", is_correct: false }
])

# ==============================================================================
# 208. Object / public_methods
# ==============================================================================
question208 = Question.create!(
  content: "p String.public_methods.include?(:upcase)\n出力は？",
  category: "Object / public_methods"
)
question208.choices.create!([
  { content: "A. true", is_correct: true },
  { content: "B. false", is_correct: false },
  { content: "C. nil", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 209. Array / flatten
# ==============================================================================
question209 = Question.create!(
  content: "p [1,[2,[3]]].flatten\n出力は？",
  category: "Array / flatten"
)
question209.choices.create!([
  { content: "A. [1,[2,[3]]]", is_correct: false },
  { content: "B. [1,2,[3]]", is_correct: false },
  { content: "C. [1,2,3]", is_correct: true },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 210. Array / product
# ==============================================================================
question210 = Question.create!(
  content: "p [1,2].product([3,4])\n出力は？",
  category: "Array / product"
)
question210.choices.create!([
  { content: "A. [[1,3],[1,4],[2,3],[2,4]]", is_correct: true },
  { content: "B. [[3,4],[1,2]]", is_correct: false },
  { content: "C. [1,2,3,4]", is_correct: false },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 211. 例外処理 / rescue 修飾子
# ==============================================================================
question211 = Question.create!(
  content: "p (1 / 0 rescue :error)\n出力は？",
  explanation: "`1 / 0` は ZeroDivisionError を発生させますが、rescue 修飾子により捕捉され、その値として `:error` が返されます。",
  category: "例外処理 / rescue 修飾子"
)
question211.choices.create!([
  { content: "A. 0", is_correct: false },
  { content: "B. nil", is_correct: false },
  { content: "C. :error", is_correct: true },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 212. 制御構造 / redo
# ==============================================================================
question212 = Question.create!(
  content: "i = 0\n[1,2].each do |n|\n  i += 1\n  redo if i < 2\nend\np i\n出力は？",
  explanation: "1. i=1, redoでブロックの先頭に戻る。\n2. i=2, redo条件を満たさないので次の要素へ。\n3. i=3, ブロック実行終了。\n結果、i は 3 となります。",
  category: "制御構造 / redo"
)
question212.choices.create!([
  { content: "A. 1", is_correct: false },
  { content: "B. 2", is_correct: false },
  { content: "C. 3", is_correct: true },
  { content: "D. 無限ループ", is_correct: false }
])

# ==============================================================================
# 213. Binding / eval
# ==============================================================================
question213 = Question.create!(
  content: "x = 10\nb = binding\np b.eval(\"x\")\n出力は？",
  explanation: "binding.eval は、binding オブジェクトが保持するスコープで文字列を評価します。",
  category: "Binding / eval"
)
question213.choices.create!([
  { content: "A. \"x\"", is_correct: false },
  { content: "B. nil", is_correct: false },
  { content: "C. 10", is_correct: true },
  { content: "D. エラー", is_correct: false }
])

# ==============================================================================
# 214. Object / tap
# ==============================================================================
question214 = Question.create!(
  content: "p (5.tap { |v| puts v * 2 })\n出力は？",
  explanation: "tap はレシーバ（5）をブロックに渡し、ブロックの処理（puts 10）を行った後、レシーバ自身（5）を返します。puts 10が先に実行され、その後 p 5 が実行されます。",
  category: "Object / tap"
)
question214.choices.create!([
  { content: "A. 10 に続き 5", is_correct: true },
  { content: "B. 5 に続き 10", is_correct: false },
  { content: "C. 10", is_correct: false },
  { content: "D. 5", is_correct: false }
])