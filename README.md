# MyNimDevelopmentKits
Nim開発環境を作るための手順書とパッケージテンプレートです。

# Nim クイックスターターガイド内容

## 目次

1. [Nimのインストール](#1-Nimのインストール)
    1. [Choosenimのインストール](#1-choosenimのインストール)
2. [VSCodeでNimの開発環境をつくる](#2-vscodeでnimの開発環境をつくる)
    1. [なぜVisual Studio Codeを用いるのか](#1-なぜvisual-studio-codeを用いるのか)
    2. [Visual Studio Codeのインストール](#2-visual-studio-codeのインストール)
    3. [Visual Studio Codeの日本語化](#3-visual-studio-codeの日本語化)
    4. [Nim開発用拡張機能のインストール](#4-nim開発用拡張機能のインストール)
    5. [デバッガのインストール](#5-デバッガのインストール)
3. [パッケージ開発の準備](#3-パッケージ開発の準備)
4. [Nimプログラムをパッケージ化](#4-nimプログラムをパッケージ化)
    1. [パッケージのビルド](#1-パッケージのビルド)
        1. [Nimble Build](#1-nimble-build)
        2. [Nimble Build (Debug)](#2-nimble-build-debug)
    2. [テスト](#2-テスト)
        1. [Nimble Test](#1-nimble-test)
        2. [Nimble Test (Debug)](#2-nimble-test-debug)
        3. [Launch (F5キー)](#3-launch-f5キー)
    3. [パッケージのドキュメント生成](#3-パッケージのドキュメント生成)

---

## 1. Nimのインストール

この章では、Nim言語開発キットのインストール手順を解説します。  
Nim単体でインストールすることも可能ですが、Nimのバージョン管理ツールであるchoosenimをインストールすると管理が楽になります。

### 1. Choosenimのインストール

Choosenim(https://github.com/dom96/choosenim.git)

上記URLの「Release」から最新バージョンの  
`choosenim-installer-X.X.X_windos_amd64-download-this-not-the-exe.zip`  
をダウンロードしましょう。

ダウンロードしたzipファイルを解凍し、中にある`runme.bat`を実行してください。

ユーザー作成のライブラリを使いたい場合は  
適当なターミナル（コマンドプロンプトやパワーシェルなど）で  
コマンド実行することでインストールできます。
```
nimble install パッケージ名
  ```

  以上でNimのインストールは完了です。

## 2. VSCodeでNimの開発環境をつくる

この章では、Visual Studio Codeというコードエディター上で  
Nim言語を用いた開発ができる環境の構築手順を解説します。

### 1. なぜVisual Studio Codeを用いるのか

有志がVisual Studio Code上でNimの開発ができるように拡張機能を公開してくださっており、構文チェック機能、サジェスト機能等が利用可能です。  
また、LLDBという高機能なデバッガも簡単に利用できるためです。

### 2. Visual Studio Codeのインストール

VisualStudioCode(https://azure.microsoft.com/ja-jp/products/visual-studio-code)

上記URLの「Visual Studio Codeをダウンロードする」をクリックし、  
画面遷移後に「Windows」ボタンをクリックし、  
`VSCodeUserSetup-x64-X.X.X.exe`をダウンロードしましょう。

ダウンロードしたファイルを実行し、インストールしてください。

以上でVisual Studio Codeのインストールは完了です。

### 3. Visual Studio Codeの日本語化

Visual Studio Codeはデフォルトで英語なので日本語化します。

ウィンドウ左側の「Extensions(拡張機能)」をクリックし、  
検索欄に「Japanese」を入力すると  
「Japanese Language Pack for Visual Studio Code」  
という拡張機能がヒットするので  
「install」ボタンをクリックしてください。

Visual Studio Codeの再起動が促されるので  
再起動すると日本語表示に変わっていると思います。

Visual Studio Codeの日本語化は完了です。

### 4. Nim開発用拡張機能のインストール

Visual Studio CodeはデフォルトではNimに対応していませんので  
対応用の拡張機能をインストールします。

ウィンドウ左側の「拡張機能」をクリックし、  
検索欄に「Nim」と入力すると  
「Nim」  
という拡張機能が沢山ヒットするので、たくさん利用されている、前回の更新日や最新更新日が1番最近のものを選び、  
「install」ボタンをクリックしてください。

以上でNim開発用拡張機能のインストールは完了です。

### 5. デバッガのインストール

Nimのデバッグ用にLLDBの拡張機能をインストールします。

ウィンドウ左側の「拡張機能」をクリックし、  
検索欄に「LLDB」と入力すると  
「CodeLLDB」  
という拡張機能がヒットするので  
「install」ボタンをクリックしてください。

以上でデバッグ用拡張機能のインストールは完了です。

## 3. パッケージ開発の準備

この章では、僕が作成したパッケージテンプレートを用いて  
パッケージ開発用フォルダの準備手順を解説します。

本来であれば、適当なターミナルでコマンド実行すれば  
いくつかの質問に答えるだけでパッケージ開発用のフォルダを生成してくれるのですが  
Visual Studio Codeでの開発に必要なファイルが不足しているので  
それらを加えたテンプレートを作成してみました。

`NimPackageMakingSet`には以下が含まれます。

- バッチファイル
- パッケージテンプレート
- 生成されたフォルダを格納するフォルダ

バッチファイルを起動するとターミナルが立ち上がり  
作成するパッケージの名称を効かれます。
答えて同意すると格納フォルダ内にリネームされたパッケージ開発用フォルダが出現します。

この中にある`パッケージ名.code-workspace`ファイルを起動すると  
Visual Studio Codeが立ち上がります。

以上でパッケージ開発の準備は完了です。

## 4. Nimプログラムをパッケージ化

この章では、Nim言語を用いたプログラムをパッケージ化、テストする手順を解説します。

以下の操作は、`.vscode`フォルダ内に格納されている  
`tasks.json`及び、`launch.json`で定義されています。

主に使用するのは

- Nimble Build (Debug)
- Nimble Build
- Launch (F5キー)
- Nimble Test (Debug)
- Nimble Test
- Nimble Doc

になると思います。

### 1. パッケージのビルド

プログラムをパッケージ化するためのタスクには、  
「Nimble Build (Debug)」と「Nimble Build」があります。

#### 1. Nimble Build

こちらはリリース用のパッケージングタスクです。  
実行ファイルは`output`フォルダ内に配置されます。

#### 2. Nimble Build (Debug)

こちらはテスト用のパッケージングタスクです。  
デバッグ用情報を付加した状態でビルドします。  
実行ファイルは`tests`フォルダ内に配置されます。  
「Launch (F5キー)」のタスク前にも実行されるので、こちら単体で実行する必要はありません。

### 2. テスト

プログラムをテストするためのタスクには  
「Nimble Test」、「Nimble Test (Debug)」、「Launch (F5キー)」があります。

#### 1. Nimble Test

こちらは`tests`フォルダ内のNimファイルをテストするためのタスクです。

#### 2. Nimble Test (Debug)

こちらは`tests`フォルダ内のNimファイルをテストするためのタスクです。  
デバッグ用情報を付加した状態でテストします。（恐らくビルドも同時にする）

#### 3. Launch (F5キー)

こちらは`tests`フォルダ内の実行ファイルをテストするためのタスクです。  
LLDBを用いて状態を監視しながら、ブレークポイントが適用された状態でテストできます。  
このタスクを行う前に自動で「Nimble Build (Debug)」タスクが実行されます。

### 3. パッケージのドキュメント生成

プログラムの構造を自動でドキュメント化するタスクとして  
「Nimble Doc」があります。

本来は、ライブラリのAPIをドキュメント化する機能であるため  
もしかしたらうまく動かないかもしれません。
