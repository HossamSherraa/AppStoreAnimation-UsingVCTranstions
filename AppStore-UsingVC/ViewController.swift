//
//  ViewController.swift
//  AppStore-UsingVC
//
//  Created by Hossam on 4/24/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class ViewController : UIViewController , UICollectionViewDelegate {
    var collectionView  : UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let flow = FlowLayout()
        let collectionView = AppStoreCollectionView(frame: .zero, collectionViewLayout: flow)
        self.collectionView = collectionView
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor) ,
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor) ,
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           let newVc = DetailsViewController(coverImage: images[indexPath.row])
        newVc.selectedCell = collectionView.cellForItem(at: indexPath)! as? AppStoreCell

        present(newVc, animated: true , completion: nil)
           
       }
}
