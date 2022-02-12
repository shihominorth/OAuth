//
//  ViewController.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-08.
//

import UIKit

protocol MainView: AnyObject {
    func update(articles: [Article], user: User)
    
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var presenter: MainPresentation!
    
    private var user: User?
    private var articles: [Article]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        collectionView.register(ArticleCollectionViewCell.self, forCellWithReuseIdentifier: "articleCVCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        articles = []
        
        self.presenter.viewDidLoad()
        
        //
        //        for _ in 0...10 {
        //            self.articles.append(Article(url: "fldfjalfklakfjlafja", title: "dfadfafafaf", lgtm: 12))
        //        }
        //
    }
    
    
}


extension MainViewController: MainView {
    func update(articles: [Article], user: User) {
        
        self.user = user
        self.articles = articles
        
        self.collectionView.reloadData()
        
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
            cell.publisherNameLbl.text = self.user?.name
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        layout.minimumInteritemSpacing = 5.0
        layout.minimumLineSpacing = 5.0
        layout.invalidateLayout()


        return CGSize(width: (self.view.frame.width - 15.0) / 2, height: 300.0)
        
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//            layout.sectionInset = UIEdgeInsets(top: 6, left: 4, bottom: 6, right: 4)
//            layout.minimumInteritemSpacing = 04
//            layout.minimumLineSpacing = 04
//            layout.invalidateLayout()
//            return CGSize(width: ((self.view.frame.width/2) - 6), height: ((self.view.frame.width / 2) - 6))
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 5.0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return  UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
//    }
}

