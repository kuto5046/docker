## My Docker repository
docker関連ファイルを格納するレポジトリ  
タスクごとにbaseとなるフォルダを作成している(ex; DL, table-ML, RLなど)  
ここにあるdockerfileをベースに、プロジェクトごとに適宜修正を加える


## Type

|  フォルダ  |  特徴  |
| ---- | ---- |
|  gpu_v1  |  軽量なubuntu imageとpoetryで構成。  |
|  gpu_v2  |  nvidiaのpytorch用imageを使用。cuda系は基本使える |
|  kaggle  |  kaggle image kaggle環境と揃えたい時に使用する  |

## Setup

レポジトリをclone
```sh
git clone git@github.com:kuto5046/docker.git
```
実行権限を付与
```sh
chmod +x ./docker/config.sh  
```
scriptの実行
```sh
./docker/config.sh <取得するフォルダ名>  # baseフォルダの中身が欲しい場合はbaseを引数として実行　
```
これで指定したフォルダにあるdocker各種ファイルがルートディレクトリに作成される

## Usage
imageのbuild
```sh
docker-compose build
```

コンテナの起動
```sh
docker-compose up -d
```
