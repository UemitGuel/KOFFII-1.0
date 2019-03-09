//
//  ZubereitungTableViewCell.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 02.03.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import UIKit

class ZubereitungTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    
    @IBOutlet weak var RoundedView: UIView!
    @IBOutlet weak var ImageView: UIImageView!
    
    
   
    @IBOutlet weak var zubereitungButton: UIButton!
    
    @IBAction func zubereitungToDetailButtonTapped(_ sender: UIButton) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ImageView.layer.cornerRadius = 8.0
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
