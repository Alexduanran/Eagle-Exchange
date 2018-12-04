//
//  SearchCell.swift
//  Eagle Exchange
//
//  Created by Alex Du on 12/3/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    @IBOutlet weak var individualNameLabel: UILabel!
    @IBOutlet weak var individualPriceLabel: UILabel!
    @IBOutlet weak var individualSellerLabel: UILabel!
    
    func fill(with item: Data) {
        individualNameLabel.text = item.name
        individualPriceLabel.text = item.price
        individualSellerLabel.text = item.seller
    }
    
}
