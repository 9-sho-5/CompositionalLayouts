import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // 1番上のcollectionView
    @IBOutlet weak var headerCollectionView: UICollectionView!
    // 2番目のcollectionView
    @IBOutlet weak var contentCollectionView: UICollectionView!
    
    // 表示するデータ
    let dataArray = ["A","B","C","D","E","F","G","H","I","J"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegate,dataSourceをそれぞれ指定する
        headerCollectionView.delegate = self
        headerCollectionView.dataSource = self
        contentCollectionView.delegate = self
        contentCollectionView.dataSource = self
        
        headerCollectionView.frame.size = CGSize(width: Int(view.frame.width), height: 140)
        
        // それぞれのカスタムセルを登録
        headerCollectionView.register(UINib(nibName: "HeaderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "headerCell")
        contentCollectionView.register(UINib(nibName: "ContentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "contentCell")

        
        // collectionViewの表示設定
        let headerLayout = UICollectionViewFlowLayout()
        // 横スクロールに設定
        headerLayout.scrollDirection = .horizontal
        // セルの大きさを設定
        headerLayout.itemSize = CGSize(width: headerCollectionView.frame.height * 0.8, height: headerCollectionView.frame.height * 0.8)
        headerLayout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        // それぞれに表示設定を適応させる
        headerCollectionView.collectionViewLayout = headerLayout
        
        // collectionViewの表示設定
        let contentLayout = UICollectionViewFlowLayout()
        // 横スクロールに設定
        contentLayout.scrollDirection = .vertical
        // 余白設定
        contentLayout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        // セルの大きさを設定
        contentLayout.itemSize = CGSize(width: headerCollectionView.frame.height * 0.4, height: headerCollectionView.frame.height * 0.4)
        // セクション毎のヘッダーサイズ.
        contentLayout.headerReferenceSize = CGSize(width:100,height:50)
        contentCollectionView.collectionViewLayout = contentLayout
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // collectionViewが1番目のcollectionView(headerCollectionView)のとき
        if collectionView == headerCollectionView {
            return 1
            // それ以外のcollectionViewのとき
        } else {
            return 3
        }
    }
    
    // collectionViewに表示させる数の指定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // collectionViewが1番目のcollectionView(headerCollectionView)のとき
        if collectionView == headerCollectionView {
            return dataArray.count
            // それ以外のcollectionViewのとき
        } else {
            return dataArray.count
        }
    }
    
    //セクションの個数を返すメソッド
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // collectionViewが1番目のcollectionView(headerCollectionView)のとき
        if collectionView == headerCollectionView {
            return 1
            // それ以外のcollectionViewのとき
        } else {
            return 3
        }
    }
    
    /*
     Sectionに値を設定する
     */
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "sectionHeader", for: indexPath)
        
        headerView.backgroundColor = UIColor.white
        
        return headerView
    }
    
    // セルに表示させる情報の設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // collectionViewが1番目のcollectionView(headerCollectionView)なら
        if collectionView == headerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "headerCell", for: indexPath) as! HeaderCollectionViewCell
            
            //cell.titleLabel.text = dataArray[indexPath.row]
            cell.thumbnailImImage.image = UIImage(named: "img\(indexPath.row)")
            
            cell.layer.cornerRadius = 5
            return cell
            // それ以外のcollectionView
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentCell", for: indexPath) as! ContentCollectionViewCell
            // 画像の設定
            cell.thumbnailImImage.image = UIImage(named: "img\(indexPath.row)")
            // 背景色
            cell.backgroundColor = .white
            // 角丸
            cell.layer.cornerRadius = 5
            
            return cell
        }
    }
    
}

