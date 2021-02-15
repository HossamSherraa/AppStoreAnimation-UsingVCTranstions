//
//  ViewControllerCell.swift
//  AppStore-UsingVC
//
//  Created by Hossam on 4/24/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class AppStoreCell : UICollectionViewCell {
    let coverImageView = UIImageView()
    let topTitle  = UILabel()
    let mainTitle = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 18
        self.contentView.addSubview(coverImageView)
        self.contentView.addSubview(topTitle)
        self.contentView.addSubview(mainTitle)
        topTitle.translatesAutoresizingMaskIntoConstraints = false
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        topTitle.text = "APPLE ARCADE"
        topTitle.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        mainTitle.numberOfLines = 0
        
        mainTitle.text = "Ride like a pro in saynara wild hearts"
        mainTitle.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        self.clipsToBounds = true
        self.coverImageView.contentMode = .scaleAspectFill
        NSLayoutConstraint.activate([
            topTitle.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 30) ,
            topTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 20),
            mainTitle.leadingAnchor.constraint(equalTo: topTitle.leadingAnchor),
            mainTitle.topAnchor.constraint(equalTo: topTitle.bottomAnchor , constant: 3),
            contentView.trailingAnchor.constraint(equalTo: mainTitle.trailingAnchor , constant: 30),
            coverImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor) ,
            coverImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            coverImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
