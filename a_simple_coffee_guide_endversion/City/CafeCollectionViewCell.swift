//
//  CafeCollectionViewCell.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 11.06.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import UIKit

class CafeCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var coffeeImage: UIImageView!
    @IBOutlet weak var cafeLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8
        
        
        
    }
}
