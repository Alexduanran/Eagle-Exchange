//
//  CatagoryViewController.swift
//  Eagle Exchange
//
//  Created by Alex Du on 11/17/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

import UIKit

class CatagoryViewController: UIViewController {
    
    @IBOutlet weak var individualCollectionView: UICollectionView!
    
    var datas: Datas!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        individualCollectionView.delegate = self
        individualCollectionView.dataSource = self
        
        datas = Datas()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        datas.loadData {
            self.individualCollectionView.reloadData()
        }
    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "ShowDetail" {
    //            let destination = segue.destination as! ProductViewController
    //            let index = individualCollectionView.indexPath(for: sender as! IndividualCollectionViewCell)!.row
    //
    //                destination.nameTextField.text = universalListItems[index].name
    //                destination.descriptionTextView.text = universalListItems[index].description
    //                destination.priceTextField.text = universalListItems[index].price
    //        }
    //    }

}

extension CatagoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let individualCell = collectionView.dequeueReusableCell(withReuseIdentifier: "individualCell", for: indexPath) as! IndividualCollectionViewCell
        let universalListItem = datas.dataArray[indexPath.row]
        
        individualCell.update(with: universalListItem)
        
        individualCell.contentView.layer.cornerRadius = 2.0
        individualCell.contentView.layer.borderWidth = 1.0
        individualCell.contentView.layer.borderColor = UIColor.clear.cgColor
        individualCell.contentView.layer.masksToBounds = true
        individualCell.layer.shadowColor = UIColor.lightGray.cgColor
        individualCell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        individualCell.layer.shadowRadius = 2.0
        individualCell.layer.shadowOpacity = 1.0
        individualCell.layer.masksToBounds = false
        individualCell.layer.shadowPath = UIBezierPath(roundedRect: individualCell.bounds, cornerRadius: individualCell.contentView.layer.cornerRadius).cgPath

        
        return individualCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productDetail: ProductViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        productDetail.publishBarButton.title = ""
        productDetail.publishBarButton.isEnabled = false
        productDetail.name = datas.dataArray[indexPath.row].name
        productDetail.descriptionText = datas.dataArray[indexPath.row].description
        productDetail.price = datas.dataArray[indexPath.row].price
        self.navigationController?.pushViewController(productDetail, animated: true)
    }
}
