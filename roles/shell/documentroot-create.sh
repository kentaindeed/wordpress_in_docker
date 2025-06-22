###########################################################################
# document root を作成して、docker compose をおいて、docker compose を起動するシェル
###########################################################################

# 変数定義
domain_name=blog.dev-tansanken.com
Document_Root=/var/www/vhosts/${domain_name}/public
ProgramDir=/var/www/vhosts/${domain_name}

# document root 作成

# ドキュメントルートが存在している場合は新たに作成しない
if [ -d ${Document_Root} ]; then
    echo "document root はすでに存在します。"
    exit 1
fi

#documet root の変数確認
if [ -z ${Document_Root} ]; then
        mkdir -p ${Document_Root}
    exit 1
fi


# github から git clone してくる
cd ${ProgramDir}
git clone https://github.com/kentaindeed/wordpress_in_docker.git


# 名前の変更など



