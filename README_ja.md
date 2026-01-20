# CoreBluetoothMock_Dependencies (日本語版)

`CoreBluetoothMock_Dependencies` は、`CoreBluetoothMock.framework` が依存する Swift パッケージをまとめて管理するためのライブラリです。  
`CoreBluetoothMock.framework` は [https://github.com/tochy0115/CoreBluetoothMock.git](https://github.com/tochy0115/CoreBluetoothMock.git) から入手できます。  
このパッケージを Swift Package Manager (SPM) を通じて追加することで、CoreBluetoothMockはCB Interaction Viewerを経由してMac OSのCoreBluetoothを利用したBLE通信ができるようになります。

## 目的

- iOS シミュレータ上で、`CoreBluetoothMock` を利用できるようにする。
- `CoreBluetoothMock` が依存する複数のライブラリを一括で管理し、手動で追加する手間を省く。
- SPM を用いた簡単な導入手順を提供。

## 対応環境

- Xcode 26.2 以降 (Swift / Objective-c)
- iOS シミュレータ (実機では CoreBluetooth を使用してください)
- Mac OS 上で **CB Interaction Viewer** を起動しておく必要があります（シミュレータ起動前に必須）

## 導入方法

1. [https://github.com/tochy0115/CoreBluetoothMock.git](https://github.com/tochy0115/CoreBluetoothMock.git) から `CoreBluetoothMock.framework` を入手し、**Frameworks, Libraries, and Embedded Content**に追加
2. アプリプロジェクトで **File > Swift Packages > Add Package Dependency...** を選択
3. 以下の URL を入力

   ```
   https://github.com/tochy0115/CoreBluetoothMock_Dependencies.git
   ```

4. バージョンを選択（例: `from: "1.0.0"`）
5. `CoreBluetoothMockDependencies` パッケージを追加

## 使い方

1. プロジェクトに `CoreBluetoothMock.framework` を追加
2. 依存パッケージとして追加した `CoreBluetoothMockDependencies` をリンク
3. CoreBluetoothMockをインポートして使用

   ```swift
   #if targetEnvironment(simulator)
   import CoreBluetoothMock
   #else
   import CoreBluetooth
   #endif

   ```
   
   ```Objective-c
   #if TARGET_OS_SIMULATOR
   #import <CoreBluetoothMock/CoreBluetoothMock.h>
   #else
   #import <CoreBluetooth/CoreBluetooth.h>
   #endif
   ```

4. シミュレータを起動する前に Mac 上で **CB Interaction Viewer** を必ず起動しておく

これで CoreBluetoothMock の API を通じて、シミュレータ上で Bluetooth の動作をモックしてテスト可能です。

## 注意点

- 実機での Bluetooth 通信テストには CoreBluetooth.framework を使用してください。
- シミュレータ用の Mock であり、実機の挙動を完全に再現するものではありません。
- CoreBluetoothMock 内の API は CoreBluetooth と同等の形を意識して作られていますが、一部動作は簡略化されています。
- CB Interaction Viewer を起動していない状態でシミュレータを起動すると、Bluetooth モックが正しく動作しません。

## ライセンス

Apache License 2.0
