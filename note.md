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
