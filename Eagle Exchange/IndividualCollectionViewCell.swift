//
//  IndividualCollectionViewCell.swift
//  Eagle Exchange
//
//  Created by Alex Du on 11/27/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

import UIKit

class IndividualCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var individualNameLabel: UILabel!
    @IBOutlet weak var individualPriceLabel: UILabel!
    @IBOutlet weak var individualSellerLabel: UILabel!
    
    var data: Data!
    
//    self.contentView.layer.cornerRadius = 2.0
//    self.contentView.layer.borderWidth = 1.0
//    self.contentView.layer.borderColor = UIColor.clear.cgColor
//    self.contentView.layer.masksToBounds = true
//    
//    self.layer.shadowColor = UIColor.black.cgColor
//    self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
//    self.layer.shadowRadius = 2.0
//    self.layer.shadowOpacity = 0.5
//    self.layer.masksToBounds = false
//    self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    
    
    func update(with data: Data) {
        individualNameLabel.text = data.name
        individualPriceLabel.text = data.price
        individualSellerLabel.text = data.seller
    }
    
//    func update(with eventDetail: ) {
//        individualNameLabel.text = eventDetail.name
//        individualPriceLabel.text = eventDetail.price
//        individualSellerLabel.text = eventDetail.seller
//    }
}
