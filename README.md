## My Docker repository
docker関連ファイルを格納するレポジトリ  
タスクごとにbaseとなるフォルダを作成している(ex; DL, table-ML, RLなど)  
ここにあるdockerfileをベースに、プロジェクトごとに適宜修正を加える


## Type

|  フォルダ  |  特徴  |
| ---- | ---- |
|  gpu  |  ubuntu imageで1から実装 condaを使用していない  |
|  gpu_v2  |  nvidiaのpytorch用imageを使用。cuda系は基本使える |


## Usage
config.shはclone後にフォルダを整理するスクリプト  
clone先のディレクトリ下で以下を実行

実行権限を付与
```
chmod +x ./docker/config.sh  
```
scriptの実行
```
./docker/config.sh <取得するフォルダ名>  # baseフォルダの中身が欲しい場合はbaseを引数として実行　
```
　
