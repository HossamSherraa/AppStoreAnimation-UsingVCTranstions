//
//  FlowLayout.swift
//  AppStore-UsingVC
//
//  Created by Hossam on 4/24/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class FlowLayout : UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        itemSize = .init(width: self.collectionView!.safeAreaLayoutGuide.layoutFrame.width - 90, height: 450)
        self.minimumLineSpacing = 50
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        true 
    }
}
