# Resonant Boot Camp Note
## Day 1
### Xcode shortcuts
- `Cmd + r`:Build
- `Cmd + 1 or 2 or ...`:simulator size change
- `Cmd + Shift + h`:Home button

### Counter app
- create project
- General
    + deployment info
        * Landscape right/Left :disabled

- 見た目
- プログラミング
- 紐付け
の順番

AppleUI
- 44 x 44以下のボタンはNG?

- Xcode に画像を入れてみる
    + 画像をD&D
        * Destination を必ずチェック（コピーしてインプット）

## Day 2
### 課題
- ガチャ
- 最低三種類以上のものをランダムに表示
- 背景やアイコン、画面遷移

#### コンセプト

## Day 3
- 画面を追加
    - storyboardにてViewControllerパーツをD&Dで追加
    - Buttonを配置
    - Buttonを`Ctrl`を押しながら次のViewControllerへドラッグ
    - この流れをSegueという
    - ツリーペインでサブクリック->`New File`し、`Cocoa Touch Class`を選び、`Subclass of`を`UIViewController`を選択。適当な名前でClassを作成。
    - 追加したViewControllerの`CustomClass`に上で作成したクラスを設定する
    - 追加したViewControllerに戻る関数(`dismiss`)を追加、ボタンに紐付け。
- 任意のタイミングで画面遷移
    - ViewControllerを選択し、`ctrl`キーを押しながら追加したViewへドラッグし、ViewControl自体をSegueでつなぐ
    - SegueのIdentifierを設定
    - 既存のViewControllerに戻るSegueする関数(`performSegue`)を設定し、

## Day 4
### Life Cycle
- [viewDidLoad]:Viewがロードされたときに呼ばれる（ほぼコンストラクタ）
    + 一度だけ呼ばれる
    + 別の画面から戻ったときには呼ばれない
- [didReceiveMemoryWarning]:メモリがやばいときに呼ばれる
- [loadView]:
- [viewWillAppear]:Viewが表示されるときに呼ばれる
- [viewDidAppear]:Viewが表示されるときに呼ばれる
- [viewWillDisappear]:Viewが消えるときに
- [viewDidDisappear]:Viewが消えるときに

### tag
パーツ番号みたいなもの

### UITableView
#### 

画面遷移
- Main.storyboard
    + ViewControllerを配置
- プロジェクトペイン
    + New File
    + Cocoa
    + ViewController(よしなにな名前)
- Main.storyboard
    + Custom Touch Classを作成したViewControllerに設定
    + ViewControllerか、もしくはButtonから`Ctrl`を押しながらドラッグして遷移先のViewにドロップ
    + 選択肢を
        * Modal:モーダルタイプそのままでOK
        * Show:Pushにしたいとき。下へ
    + 元のViewを選択した状態で`Editor`->`Embed in`->`Navigation Controller`
    + `Simulated Metrics`->`Top Bar`->`Opaque Navigation Bar`だとナビバーを透明にしない設定となる。
    + ナビバー上では通常ボタンはNG
        * `Bar Button Item`を使う
        * Labelを起きたい場合も、`Navigation item`を使うこと。
- ViewController
    +

## Custom Cell
### Main.storyboard
- TableViewを追加
- TableViewにTableCellを追加
- TableCellのIdentifierを設定(`tableCellId`)
- TableCellの大きさを設定

### project Pain
+ New File
+ Cacao Touch Class
    - Class: any(ex.`sampleTableViewCell`)
    - Subclass: UITableViewCell
    - Enable `Also Create XIB file`

### sampleTableViewCell.xib
- 任意のパーツ（ラベルなど）を追加
- セルのIdentifierを`tableCellId`に設定

### sampleTableViewCell.swift
- `@IBOutlet`で追加したパーツを宣言

### sampleTableViewCell.xib
- パーツのヒモ付作業

### ViewController.swift
- class宣言に`UITableViewDataSource`と`UITableViewDelegate`を追記
- `@IBOutlet`で`UITableView`を宣言
- `viewDidLoad`に下記を追記
    ```swift
    sampleTableView.dataSource = self
    sampleTableView.delegate = self
    sampleTableView.tableFooterView = UIView()
    let nib = UINib(nibName: "XIBファイルの名前", bundle: Bundle.main)
    sampleTableView.register(nib, forCellReuseIdentifier: "セルに付けたIdentifier")
    ```
- 下記の関数を追加
    ```swift
    // テーブルのMAX数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MAX_TABLE_AMOUNT //だいたいの場合、"利用する配列.count"
    }
    // テーブルに表示するコンテンツを決める
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "セルに付けたIdentifier") as! XIBファイルの名前
        cell.カスタムセルで宣言したLabel.text = listContent[indexPath.row]["contentName"]
        cell.listImageView.image = UIImage(named: listContent[indexPath.row]["imageName"]!)
        return cell
    }
    // テーブルのセルをタッチしたときの動作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)    //選択状態解除
    }
    // 次のViewへ値を渡したりする
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let selectedIndex = listTableView.indexPathForSelectedRow!
        detailViewController.selectedName = listContent[selectedIndex.row]["contentName"]!
        detailViewController.selectedImage = UIImage(named: listContent[selectedIndex.row]["imageName"]!)
    }

    ```

### Main.storyboard
- 宣言したTableを紐付け
