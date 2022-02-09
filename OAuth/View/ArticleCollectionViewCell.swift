//
//  MainCollectionViewCell.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-08.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    
    let imgView: UIImageView
    let titleLbl: UILabel
    
    override init(frame: CGRect) {
        
        imgView = {
            
            let imgView = UIImageView()
            imgView.translatesAutoresizingMaskIntoConstraints = false
            imgView.accessibilityIdentifier = "main img view"
            
            return imgView
        }()
        
        titleLbl = {
            
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.accessibilityIdentifier = "title lbl"
            
            return lbl
            
        }()
        
        
        super.init(frame: frame)
        
        self.contentView.addSubview(imgView)
        self.contentView.addSubview(titleLbl)
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            imgView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            imgView.widthAnchor.constraint(equalToConstant: self.contentView.frame.width * 0.9),
            imgView.heightAnchor.constraint(equalToConstant: self.contentView.frame.width * 0.9)
        ])
        
        
        NSLayoutConstraint.activate([
            titleLbl.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            titleLbl.topAnchor.constraint(equalTo: self.imgView.bottomAnchor, constant: 10),
            titleLbl.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            titleLbl.widthAnchor.constraint(equalToConstant: self.contentView.frame.width * 0.9)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.contentView.layer.cornerRadius = 15.0
        contentView.layer.masksToBounds = true
        
        // Set masks to bounds to false to avoid the shadow
        // from being clipped to the corner radius
        layer.cornerRadius = 15.0
        layer.masksToBounds = false
        
        // Apply a shadow
        layer.shadowRadius = 8.0
        layer.shadowOpacity = 0.10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
        
    }
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        // Improve scrolling performance with an explicit shadowPath
        layer.shadowPath = UIBezierPath(
            roundedRect: bounds,
            cornerRadius: 15.0
        ).cgPath
    }
    
}
