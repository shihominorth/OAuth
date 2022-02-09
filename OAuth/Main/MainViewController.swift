//
//  ViewController.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-08.
//

import UIKit

protocol MainView: AnyObject {
    func updateArticles(articles: [ArticleEntity])
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var presenter: MainPresentation!
    private var articles: [ArticleEntity]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        collectionView.register(ArticleCollectionViewCell.self, forCellWithReuseIdentifier: "articleCVCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //        self.articles = [Article(url: "jfakhfahkaflajk", title: "title title"), Article(url: "dfjahahfljksdlfj", title: "title title sdkfjlakfjla")]
        articles = []
        
        for _ in 0...10 {
            self.articles.append(ArticleEntity(url: "jfakhfahkaflajk", title: "title title"))
        }
        
    }
    
    
}


extension MainViewController: MainView {

    func updateArticles(articles: [ArticleEntity]) {
        self.articles = articles
    }

}



extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCVCell", for: indexPath) as? ArticleCollectionViewCell {
            
            cell.titleLbl.text = self.articles[indexPath.row].title
            cell.imgView.image = UIImage(systemName: "square.and.arrow.up")


            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 15) / 2, height: 300.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return  UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
    }
}

