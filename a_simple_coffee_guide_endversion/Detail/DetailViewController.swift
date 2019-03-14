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
    
    
    @IBOutlet weak var firstSeparator: UIView!
    @IBOutlet weak var secondSeparator: UIView!
    @IBOutlet weak var thirdSeparator: UIView!
    
    
    
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var brewingLabel: UILabel!
    
    @IBOutlet weak var infoTableView: UITableView!
    
    @IBOutlet weak var leftComplainButton: UIButton!
    @IBOutlet weak var rightComplainButton: UIButton!
    
    
    
    // var/let
    
    var passedDict = [String : Any]()
    
    var coffeetoobitter : [String : Any] = ["Complain":"coffee too bitter?", "Improvements": ["You should do this", "and that", "aaand this and that"]]
    
    var coffeetoosour : [String : Any] = ["Complain":"coffee too sour?", "Improvements": ["You should do this", "and that", "aaand this and that"]]
    
    var espressotoobitter : [String : Any] = ["Complain":"espresso too bitter?", "Improvements": ["You should do this", "and that", "aaand this and that"]]
    
    var espressotoosour : [String : Any] = ["Complain":"espresso too sour?", "Improvements": ["You should do this", "and that", "aaand this and that"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting Image and Name
        detailImageView.image = passedDict["Image"] as? UIImage
        detailImageView.layer.cornerRadius = 8
        //chosenPreparationLabel.text = passedDict["Name"] as? String
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.title = passedDict["Name"] as? String
        
        quantityLabel.text = passedDict["Quantity"] as? String
        temperatureLabel.text = passedDict["Temp"] as? String
        brewingLabel.text = passedDict["Time"] as? String
        
        leftComplainButton.setTitle(coffeetoobitter["Complain"] as? String, for: .normal)
        rightComplainButton.setTitle(coffeetoosour["Complain"] as? String, for: .normal)
        
        infoTableView.dataSource = self
        infoTableView.delegate = self
        
        firstSeparator.layer.cornerRadius = 1.5
        secondSeparator.layer.cornerRadius = 1.5
        thirdSeparator.layer.cornerRadius = 1.5
        
        self.infoTableView.rowHeight = UITableView.automaticDimension
        self.infoTableView.estimatedRowHeight = 82.0; // set to whatever your "average" cell height is
        
        
        }
    
    override func viewDidAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .white
    }
    
    // Complain Buttons Tapped
    
    @IBAction func leftComplainButtonTapped(_ sender: UIButton) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ComplainViewController") as? ComplainViewController {
            vc.complainDict = coffeetoobitter
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @IBAction func rightComplainButtonTapped(_ sender: UIButton) {
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
    
}

extension DetailViewController: UITableViewDelegate {
    
}
