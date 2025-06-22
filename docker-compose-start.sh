###########################################################################
# document root を作成して、Git repo を引っ張るシェルスクリプト
###########################################################################

# 変数定義
domain_name="blog.dev-tansanken.com"
Document_Root="/var/www/vhosts/${domain_name}/"


# ドキュメントルート移動
cd ${Document_Root}


# 環境準備
cp -ip .env.example .env

cp -ip docker-compose.yml.v1 docker-compose.yml
