# これは何

docker でwordpress のホストをする環境を作成するセットになります。
下記の手順を参考にして環境を構築してください


## 手順
1 host ファイルなどの調整
※target yml を調整してください
```bash
- name: docker でwordpress 環境
  hosts: localhost

```

2 ansible の実行

```bash
# dry run
ansible-playbook -i hosts target.yml --check

# 実行
ansible-playbook -i hosts target.yml
```

3 env ファイルなどの調整

```bash
sh docker-compose-start.sh
```

4 env の中身のパスワードなどを各自で調整

それぞれに変数をいれてください
```bash
vim .env

DB_DATABASE=
DB_USER=
DB_PASSWORD=

WORDPRESS_DB_HOST=
WORDPRESS_DB_NAME=
WORDPRESS_DB_USER=
WORDPRESS_DB_PASSWORD=
```

5 docker compose で起動
```bash
docker compose up -d
```

6 apache2.conf をdocker 側から取得
```bash
#default ディレクトリを作成
mkdir -p ./apache2/etc/default/

# ホスト側に apache 2 conf を取得
docker cp tansanken_wp:/etc/apache2/apache2.conf ./apache2/etc/default/apache2.conf

# docker compose yml の該当箇所のコメントを外して、docker compose restart

 #- ./apache2/etc/default/apache2.conf:/etc/apache2/apache2.conf
↓
 - ./apache2/etc/default/apache2.conf:/etc/apache2/apache2.conf

# restart 反映
docker compose restart
```