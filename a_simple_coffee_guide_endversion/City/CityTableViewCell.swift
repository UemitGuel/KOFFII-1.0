//
//  CityTableViewCell.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 23.05.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var cafeImageView: UIImageView!
    
    @IBOutlet weak var cityCellLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cafeImageView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
