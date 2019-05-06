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
    
    var passedKnowledge : Knowledge = Knowledge(name: "", imageName: "", tips:[""])
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.setNavigationBarHidden(false, animated: true)

        setupNavBar()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Setting Image and Name
        imageView.image = UIImage(named: passedKnowledge.imageName)
        imageView.layer.cornerRadius = 8
        
        self.title = passedKnowledge.name
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        setupNavBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = ""
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func setupNavBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        title = passedKnowledge.name
        
        let customFont = UIFont(name: "Staatliches-Regular", size: 40)
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: customFont ?? UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.bold) ]
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

extension OtherDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OtherDetailTableViewCell", for: indexPath) as! OtherDetailTableViewCell
        let arrayOfTips = passedKnowledge.tips
        cell.otherDetailLabel.text = arrayOfTips[indexPath.row]
        cell.selectionStyle = UITableViewCell.SelectionStyle.none

        
        
        switch passedKnowledge.name {
        case "Storage":
            cell.icon.image = UIImage(named: "Coffee_Storage")
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
        let arrayOfTips = passedKnowledge.tips
        return arrayOfTips.count
        
    }
    
}

extension OtherDetailViewController: UITableViewDelegate {
    
}
