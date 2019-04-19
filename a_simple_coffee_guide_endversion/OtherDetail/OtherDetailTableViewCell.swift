//
//  OtherDetailTableViewCell.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 19.04.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import UIKit

class OtherDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var otherDetailLabel: UILabel!
    
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
