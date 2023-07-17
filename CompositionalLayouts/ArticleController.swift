import UIKit

struct Article: Hashable {
    let title: String
    let urlString: String
    let icon: UIImage!
    
    let identifier = UUID()
    func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }
}

struct ArticleCollection: Hashable {
    let categoryName: String
    var articles: [Article]
    
    let identifier = UUID()
    func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }
}

class ArticleController {
    var articleCollections = [ArticleCollection]()
    
    init() {
        generateCollections()
    }
    
    private func generateCollections() {
        articleCollections = [ArticleCollection(categoryName: "おすすめ",
                                                articles: [Article(title: "フューチャー夏のインターン2020。リモート開催予定です", urlString: "https://future-architect.github.io/articles/20200606/", icon: UIImage(named: "recommend1")!),
                                                           Article(title: "フューチャー技術ブログの運営で心がけていること", urlString: "https://future-architect.github.io/articles/20200530/", icon: UIImage(named: "blogManagement")!),
                                                           Article(title: "あなたのGoアプリ/ライブラリのパッケージ構成もっとシンプルでよくない？", urlString: "https://future-architect.github.io/articles/20200528/", icon: UIImage(named: "goPackage")!)]),
                              ArticleCollection(categoryName: "春の入門祭り 🌸",
                                                articles: [Article(title: "#01 Goのテストに入門してみよう！", urlString: "https://future-architect.github.io/articles/20200601/", icon: UIImage(named: "spring1")!),
                                                           Article(title: "#02 Google Cloud Platform 101", urlString: "https://future-architect.github.io/articles/20200602/", icon: UIImage(named: "spring2")!),
                                                           Article(title: "#03 ゼロから始めるFlutter生活", urlString: "https://future-architect.github.io/articles/20200603/", icon: UIImage(named: "spring3")!),
                                                           Article(title: "#04 NW入門", urlString: "https://future-architect.github.io/articles/20200604/", icon: UIImage(named: "spring4")!),
                                                           Article(title: "#05 データベース　テーブル設計入門", urlString: "https://future-architect.github.io/articles/20200605/", icon: UIImage(named: "spring5")!),
                                                           Article(title: "#06 とあるマイコンのクロスコンパイラ", urlString: "https://future-architect.github.io/articles/20200608/", icon: UIImage(named: "spring6")!),
                                                           Article(title: "#07 作って学ぶGraphQL。gqlgenを用いて鉄道データ検索API開発入門", urlString: "https://future-architect.github.io/articles/20200609/", icon: UIImage(named: "spring7")!),
                                                           Article(title: "#08 人生を豊かにする文字列diff入門", urlString: "https://future-architect.github.io/articles/20200610/", icon: UIImage(named: "spring8")!),
                                                           Article(title: "#09 Grep, Git grepの便利オプション", urlString: "https://future-architect.github.io/articles/20200611/", icon: UIImage(named: "spring9")!),
                                                           Article(title: "#10 denoに触れてみよう", urlString: "https://future-architect.github.io/articles/20200612/", icon: UIImage(named: "spring10")!)]),
                              ArticleCollection(categoryName: "Go Tips連載",
                                                articles: [Article(title: "#01 ホワイトリストProxy申請するときのGo依存ライブラリURLドメインの調べ方", urlString: "https://future-architect.github.io/articles/20200518/", icon: UIImage(named: "go1")!),
                                                           Article(title: "#02 Golandで環境変数をさっと貼る方法", urlString: "https://future-architect.github.io/articles/20200519/", icon: UIImage(named: "go2")!),
                                                           Article(title: "#03 ファイルを扱うちょっとしたスクリプトをGoで書くときのTips5選", urlString: "https://future-architect.github.io/articles/20200520/", icon: UIImage(named: "go1")!),
                                                           Article(title: "#04 GoDocの読み方", urlString: "https://future-architect.github.io/articles/20200521/", icon: UIImage(named: "go4")!),
                                                           Article(title: "#05 エラーコードベースの例外ハンドリングの実装＋morikuni/failureサンプル", urlString: "https://future-architect.github.io/articles/20200522/", icon: UIImage(named: "go5")!),
                                                           Article(title: "#06 Error wrappingされた各クラウドSDKの独自型エラーを扱う", urlString: "https://future-architect.github.io/articles/20200523/", icon: UIImage(named: "go6")!),
                                                           Article(title: "#07 【golangci-lint】lint issueを新たに作り出さないためのTips", urlString: "https://future-architect.github.io/articles/20200525/", icon: UIImage(named: "go7")!),
                                                           Article(title: "#08 logパッケージでログ出力している場所の情報を出す", urlString: "https://future-architect.github.io/articles/20200527/", icon: UIImage(named: "go8")!)]),
                              ArticleCollection(categoryName: "Serverless連載",
                                                articles: [Article(title: "#01: SAMを使ったローカルテスト（Go編）", urlString: "https://future-architect.github.io/articles/20200323/", icon: UIImage(named: "serverless1")!),
                                                           Article(title: "#02 AWS Lambda×Goの開発Tips", urlString: "https://future-architect.github.io/articles/20200326/", icon: UIImage(named: "serverless2")!),
                                                           Article(title: "#03 Goでサーバーレス用の検索エンジンwatertowerを作ってみました", urlString: "https://future-architect.github.io/articles/20200327/", icon: UIImage(named: "serverless3")!),
                                                           Article(title: "#04 Firebase CrashlyticsでAndroidアプリのエラーログをさくっと収集する", urlString: "https://future-architect.github.io/articles/20200330/", icon: UIImage(named: "serverless4")!),
                                                           Article(title: "#05 CloudEventsのGo版SDKをいじってみる", urlString: "https://future-architect.github.io/articles/20200331/", icon: UIImage(named: "serverless5")!)])]
    }
}

extension ArticleController {
    func getArticleUrl(with hash: Int) -> String? {
        for collection in articleCollections {
            for article in collection.articles {
                if article.hashValue == hash {
                    return article.urlString
                }
            }
        }
        return nil
    }
}
