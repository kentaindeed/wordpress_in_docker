###########################################################################
# document root を作成して、docker compose をおいて、docker compose を起動するシェル
###########################################################################

# 変数定義
domain_name="blog.dev-tansanken.com"
Document_Root="/var/www/vhosts/${domain_name}/"
ProgramDir="/var/www/vhosts/${domain_name}/"
GitRepo="https://github.com/kentaindeed/docker_my_wordpress.git"


# ドキュメントルート作成
if [ -z "${domain_name}" ]; then
    echo "エラー: 'DOMAIN_NAME' 変数が設定されていません。スクリプトを終了します。" >&2
    exit 1
fi

if [ -z "${Document_Root}" ]; then
    echo "エラー: 'Document_Root' 変数が設定されていません。スクリプトを終了します。" >&2
    exit 1
fi

if [ -d "${Document_Root}" ]; then
    echo "情報: ドキュメントルート '${Document_Root}' は既に存在します。スキップします。"
else
    # 4. ドキュメントルートが存在しない場合、作成する
    echo "情報: ドキュメントルート '${Document_Root}' を作成します..."
    mkdir -p "${Document_Root}"

    # 5. ディレクトリ作成の成否をチェック
    if [ $? -ne 0 ]; then
        echo "エラー: ドキュメントルート '${Document_Root}' の作成に失敗しました。" >&2
        exit 1
    else
        echo "成功: ドキュメントルート '${Document_Root}' を作成しました。"
        cd ${ProgramDir}
    fi
fi


# Git clone 実行
echo " プログラムファイルのデプロイを開始します" 

if [ -z "${GitRepo}" ]; then
    echo "エラー: 'GitRepo' 変数が設定されていません。スクリプトを終了します。" >&2
    exit 1
fi

if [ -d "${ProgramDir}/.git" ]; then
    echo "情報: Git リポジトリが既に存在します。スキップします。"
else
    # Git clone 実行
    echo "情報: Git リポジトリをクローンします..."
    git clone ${GitRepo} ${ProgramDir}
    # Git clone の成否をチェック
    if [ $? -ne 0 ]; then
        echo "エラー: Git リポジトリのクローンに失敗しました。" >&2
        exit 1
    else
        echo "成功: Git リポジトリをクローンしました。"
    fi
fi




