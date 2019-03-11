//
//  DetailViewController.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 05.03.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var chosenPreparationLabel: UILabel!
    
    
    
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var brewingLabel: UILabel!
    
    @IBOutlet weak var infoTableView: UITableView!
    
    @IBOutlet weak var optionLeftLabel: UILabel!
    @IBOutlet weak var optionRightLabel: UILabel!
    
    // var/let
    
    var passedDict = [String : Any]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting Image and Name
        detailImageView.image = passedDict["Image"] as? UIImage
        chosenPreparationLabel.text = passedDict["Name"] as? String
        
        quantityLabel.text = passedDict["Quantity"] as? String
        temperatureLabel.text = passedDict["Temp"] as? String
        brewingLabel.text = passedDict["Time"] as? String
        
        infoTableView.dataSource = self
        infoTableView.delegate = self
        
    }

}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        let arrayOfTips = passedDict["Tips"] as! [String]
        cell.tableViewCellLabel.text = arrayOfTips[indexPath.row]
        return cell
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arrayOfTips = passedDict["Tips"] as! [String]
        return arrayOfTips.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 81.5
    }
    
}

extension DetailViewController: UITableViewDelegate {
    
}
