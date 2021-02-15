//
//  CollectionView.swift
//  AppStore-UsingVC
//
//  Created by Hossam on 4/24/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class AppStoreCollectionView : UICollectionView ,UICollectionViewDataSource  {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.register(AppStoreCell.self, forCellWithReuseIdentifier: "AppStoreCell")
        self.dataSource = self
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppStoreCell", for: indexPath) as! AppStoreCell
        cell.coverImageView.image = images[indexPath.row]
        return cell
    }
    
   

}
