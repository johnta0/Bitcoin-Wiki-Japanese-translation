# トランザクション
トランザクションとは、ビットコインの価値の移転のことで、その価値の移転はP2Pネットワークに公開され、いくつかのトランザクションが１つのブロックにまとめられる。一般にトランザクションは１つ前のトランザクションアウトプットを新しいトランザクションのインプットとして参照し、そしてそのインプット全てを、新しいアウトプットとして利用する[ココわかりづらいな]。トランザクションは暗号化されていないため、誰もがブロックとして集められたすべてのトランザクションを閲覧することができる。

標準的なトランザクションアウトプットはアドレスを指定し、将来それをインプットとして使用するには適切な電子署名が必要である。

すべてのトランザクションはブロックチェーン上に公開されており、hex editorを用いて閲覧できる。[ブロックチェーンブラウザ](https://en.bitcoin.it/wiki/Category:Block_chain_browsers)と呼ばれる類のウェブサイトでは、ブロックチェーンに含まれる全てのトランザクションを人間に理解しやすい形で見ることができる。ブロックチェーンブラウザは実行中のトランザクションのテクニカルな詳細を確認したり、支払いを証明したりするのに便利である。

## ビットコイン・トランザクションの一般的なフォーマット（１ブロック内）

| Field | Description | Size |
|:-----------|------------:|:------------:|
| Version no  | currently 1 | 4 bytes |
| In - counter | positive integer VI = VarInt | 1-9 bytes |
| list of inputs | the first input of the first transaction is also called "coinbase" (its content was ignored in earlier versions) | <in-counter> many inputs |
| Out-counter | positive integer VI = VarInt | 1-9 bytes |
| list of outputs | the outputs of the first transaction spend the mined bitcoins for the block | <out-counter> many outputs |
| lock_time | if non-zero and sequence numbers are <0xFFFFFFFF: block heightor timestamp when transaction is final | 4 bytes |

## インプットとアウトプットが１つずつの原始的なトランザクションの例

### データ

```
Input:
Previous tx: f5d8ee39a430901c91a5917b9f2dc19d6d1a0e9cea205b009ca73dd04470b9a6
Index: 0
scriptSig: 304502206e21798a42fae0e854281abd38bacd1aeed3ee3738d9e1446618c4571d10
90db022100e2ac980643b0b82c0e88ffdfec6b64e3e6ba35e7ba5fdd7d5d6cc8d25c6b241501

Output:
Value: 5000000000
scriptPubKey: OP_DUP OP_HASH160 404371705fa9bd789a2fcd52d2c580b65d35549d
OP_EQUALVERIFY OP_CHECKSIG
```


### 説明
このトランザクションのインプットでは、アウトプット#0のトランザクション f5d8... から50BTCをインポートしている。そしてそのアウトプットが50BTCをビットコインアドレスに送る（ここでは通常の[base58](https://bitflyer.jp/ja/glossary/base58)ではなく１６進数 4043... で表されている）。このトランザクションでビットコインを受け取った人がこのビットコインを使用したい時は、彼のトランザクションのインプット内にあるこのトランザクションのアウトプット#0を参照する。


### インプット
インプットとは、１つ前のトランザクションからのアウトプットへの参照である。？ トランザクションには複数のインプットが存在することが多い。新しいトランザクションの全てのインプットの値（＝新しいトランザクションが参照した複数アウトプットの合計の値）が足し合わされて、それが全て新しいトランザクションのアウトプットとして完全に使用される。"Previous tx"は、１つ前のトランザクションのハッシュ値を指す。"Index"は参照されたトランザクションの中の特定のアウトプットである。"ScriptSig"は、スクリプトの前半部分に当たる（詳しくは後に説明する）。

スクリプトは２つの構成要素からなる：署名と公開鍵だ。公開鍵はredeemedアウトプットのスクリプトに書かれているハッシュ値と合致しなければならない。公開鍵は所有者の署名を検証するために使われる。これが２つめの構成要素である。より正確には、２つ目の構成要素は簡略化されたバージョンのトランザクションのハッシュ値に署名されたECDSA（楕円曲線暗号）署名である。その署名が、公開鍵と組み合わされて、トランザクションがビットコインの本当の所有者によって作成されたことを証明する。様々なflags がトランザクションがどのように簡略化されたのかを定義し、色々なタイプのペイメントを作るのに使うことができる。

### アウトプット
アウトプットには、ビットコインを送るための指示（手順）が書かれている。"Value"は、このアウトプットが宣言された時のビットコインの価値で、単位はSatoshi(1BTC= 100,000,000Satoshi)である。"scriptPubKey"は、スクリプトの後半部分である。


### 検証


## トランザクションの種類

## Pay-to-PubkeyHash(P2PH)

## Pay-to-Script-Hash(P2SH)
