//
//  OtherDetailViewController.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 16.04.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import UIKit

class OtherDetailViewController: UIViewController {

    // let/var
    
    var passedDict = [String : Any]()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Setting Image and Name
        imageView.image = passedDict["Image"] as? UIImage
        imageView.layer.cornerRadius = 8
        
        self.title = passedDict["Name"] as? String
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}

extension OtherDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OtherDetailTableViewCell", for: indexPath) as! OtherDetailTableViewCell
        let arrayOfTips = passedDict["Tips"] as! [String]
        cell.otherDetailLabel.text = arrayOfTips[indexPath.row]
        
        
        switch passedDict["Name"] as? String {
        case "Storage":
            cell.icon.image = UIImage(named: "Storage_Icon")
        case "Coffee water":
            cell.icon.image = UIImage(named: "Water_Icon")
        case "Health":
            cell.icon.image = UIImage(named: "Health_Icon")
        case "History of Coffee":
            cell.icon.image = UIImage(named: "History_Icon")
        case "Fabrication":
            cell.icon.image = UIImage(named: "Fabrication_Icon")
        case "Regions":
            cell.icon.image = UIImage(named: "Region_Icon")
        default:
            cell.icon.image = UIImage(named: "Coffeebean_Icon")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arrayOfTips = passedDict["Tips"] as! [String]
        return arrayOfTips.count
        
    }
    
}

extension OtherDetailViewController: UITableViewDelegate {
    
}
