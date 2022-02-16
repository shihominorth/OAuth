//
//  ViewController.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-08.
//

import UIKit
import Kingfisher

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
   
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.presenter.viewWillAppear()

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
            
            
            if let myInfo = self.user {
                cell.imgView.kf.setImage(with: myInfo.profile_image_url)
            }
          
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
 
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter.selectedCell(article: articles[indexPath.row])
    }
    
}

