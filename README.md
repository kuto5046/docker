## My Docker repository
docker関連ファイルを格納するレポジトリ  
タスクごとにbaseとなるフォルダを作成している(ex; DL, table-ML, RLなど)  
ここにあるdockerfileをベースに、プロジェクトごとに適宜修正を加える

config.shはclone後にフォルダを整理するスクリプト  
clone先のプロジェクトのrootディレクトリで以下を実行
```
./docker/config.sh
```