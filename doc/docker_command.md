# about Docker

### docker command
#### build image from Dockerfile
```
docker build .
```
imageを作るときの対象のdirをbuildの後に指定  
このdirの範囲をdocker contextsという
build時にdocker contexts内のfileをtarに圧縮してdocker demonに送る  
この時dockerに関係のないfile(csv dataとかpyファイルとか)があるとbuildが遅くなる  
それを避けるためには.dockerignoreを使う  

<p>

#### create container from image
```
$ docker run -it <IMAGE>:<VERSION> <COMMAND>  
```
IMAGE:VERSION : 使用するimage (VERSIONは省略化)
COMMAND: はコンテナ作成時に実行するコマンド
-it : exitしないようにするおまじない  
-i : インプット可能 ホストからコンテナ(linux)への入力を可能にする  
-t : 表示を整える(promptなどを出す)   
  
#### other option 
```
-d
```
detach : command実行後, existせず起動しておける  

```
-v <MOUNT元DIR>:<MOUNT先DIR>
```
ホスト側のfileやdirをコンテナ側にマウントする    

```
--rm
```
コンテナをexitした時、コンテナを削除する  
コンテナを使い捨てとして使う時便利  

```
—name <CONTAINER NAME
```
コンテナ名をつける  
使い捨てではなくずっとコンテナを置いておきたい時とかは便利  
  
  
#### 既存のコンテナの中に入りたい時  
```
$ docker exec -it <CONTAINER> <COMMAND> 
```
containerに対してcommandを実行  
containerに入って作業したい時とかは bin/bashを指定すればいい  
コンテナを作るのではなく　既存のコンテナに入るイメージ  
コンテナが起動していないと使えない  


#### ライブラリを追加したい場合
Dockerfileにpipで追加
cdでDockerfileのあるのディレクトリに移動
docker-compose up --build


### docker-compose command  
docker run のコマンドが長かったり複数のコンテナを起動したい時とかに便利
runで毎回長いcommand書くの面倒なので基本こっちを使った方がいいかな  
dockerの方が理解できていれば難しくない  

#### docker-compose.ymlを適用してrunする時  
```
$ docker-compose up
```
docker runの役割 
docker-compose.ymlを書き換えた場合こちら  
imageがbuildされていない場合はbuildも行う  
ただしDockerfileを更新した場合はupだけだと古いイメージが使われる  
その場合は以下のコマンドを実行  

#### imageのbuildからやり直したい時  
```
$ docker-compose up  --build
```
これによってbuildしてrun  
Dockerfileを書き換えた場合こちら  

#### 既存のcontainerを利用したい時   

```
$ docker-compose exec <SERVICE> <COMMAND>
```
serviceに対してcommandを実行  
serviceはdocker-compose.ymlに指定したもの  
  
```
$ docker-compose down
```
stopしてrm  
やり直したい時便利  