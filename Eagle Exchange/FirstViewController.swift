//
//  FirstViewController.swift
//  Eagle Exchange
//
//  Created by Alex Du on 11/15/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var featuredCollectionView: UICollectionView!
    @IBOutlet weak var catagoryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        featuredCollectionView.delegate = self
        featuredCollectionView.dataSource = self
        
        catagoryCollectionView.delegate = self
        catagoryCollectionView.dataSource = self
        
    }


}

extension FirstViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.featuredCollectionView {
            return 3
        } else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.featuredCollectionView {
            let featuredCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedCell", for: indexPath) as UICollectionViewCell
            return featuredCell
        } else {
            let catagoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatagoryCell", for: indexPath) as UICollectionViewCell
            return catagoryCell
        }
        
    }
}
