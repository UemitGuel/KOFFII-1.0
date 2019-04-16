//
//  KnowledgeTableViewCell.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 17.03.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import UIKit

class KnowledgeTableViewCell: UITableViewCell {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageview.layer.cornerRadius = 8.0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
