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
    let publisherNameLbl: UILabel
    
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
            lbl.numberOfLines = 0
            
            return lbl
            
        }()
        
        publisherNameLbl = {
            
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.accessibilityIdentifier = "publisher lbl"
            
            return lbl
            
        }()
        
        
        super.init(frame: frame)
        
        self.contentView.addSubview(imgView)
        self.contentView.addSubview(titleLbl)
        self.contentView.addSubview(publisherNameLbl)
        
        NSLayoutConstraint.activate([
            titleLbl.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            titleLbl.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            titleLbl.widthAnchor.constraint(equalToConstant: self.contentView.frame.width * 0.9),
            titleLbl.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor),
            titleLbl.heightAnchor.constraint(equalToConstant: self.contentView.frame.height * 0.6)
        ])
        
        NSLayoutConstraint.activate([
            imgView.widthAnchor.constraint(equalToConstant: self.contentView.frame.width * 0.2),
            imgView.heightAnchor.constraint(equalToConstant: self.contentView.frame.width * 0.2),
            imgView.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            imgView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 10.0),
            
        ])
        
        
        NSLayoutConstraint.activate([
            publisherNameLbl.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 10),
            publisherNameLbl.centerYAnchor.constraint(equalTo: imgView.centerYAnchor),
            publisherNameLbl.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor)
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
        layer.borderWidth = 1.0
        
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
