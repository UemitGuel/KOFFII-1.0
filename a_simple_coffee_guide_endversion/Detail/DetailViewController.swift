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
    
    @IBOutlet weak var quantityLabelAbove: UILabel!
    @IBOutlet weak var temperatureLabelAbove: UILabel!
    @IBOutlet weak var brewingLabelAbove: UILabel!
    
    
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var brewingLabel: UILabel!
    
    @IBOutlet weak var infoTableView: UITableView!
    
    @IBOutlet weak var leftComplainButton: UIButton!
    @IBOutlet weak var rightComplainButton: UIButton!
    
    
    
    // var/let
    
    var passedbrewing : Brewing = Brewing(name: "", imageName: "", quantity: "", temperatur: "", time: "", tips: [""], tipsonestring: "")
    
    var complains = [Complain]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("load")
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.setNavigationBarHidden(false, animated: true)

        setupNavBar()
        
        setupLanguage()
        
        
        
        // Setting Image and Name
        detailImageView.image = UIImage(named: passedbrewing.imageName)
        detailImageView.layer.cornerRadius = 8
        //chosenPreparationLabel.text = passedDict["Name"] as? String
        
        
        self.title = passedbrewing.name
        
        quantityLabel.text = passedbrewing.quantity
        temperatureLabel.text = passedbrewing.temperatur
        brewingLabel.text = passedbrewing.time
        
        
        if passedbrewing.name != "Bialetti" && passedbrewing.name != "Espresso" {
            leftComplainButton.setTitle(complains[0].complain, for: .normal)
            rightComplainButton.setTitle(complains[1].complain, for: .normal)
        } else {
            leftComplainButton.setTitle(complains[2].complain, for: .normal)
            rightComplainButton.setTitle(complains[3].complain, for: .normal)
        }
        
        infoTableView.dataSource = self
        infoTableView.delegate = self
        
        firstSeparator.layer.cornerRadius = 1.5
        secondSeparator.layer.cornerRadius = 1.5
        thirdSeparator.layer.cornerRadius = 1.5
        
        self.infoTableView.rowHeight = UITableView.automaticDimension
        self.infoTableView.estimatedRowHeight = 82.0; // set to whatever your "average" cell height is
        }
    
    func setupLanguage() {
        if ZubereitungViewController.GlobalVariable.EN_DE == "EN" {
            complains = ComplainBank().listEng
            quantityLabelAbove.text = "Quantity"
            temperatureLabelAbove.text = "Temperature"
            brewingLabelAbove.text = "Brewing Time"
        } else {
            complains = ComplainBank().listGer
            quantityLabelAbove.text = "Menge"
            temperatureLabelAbove.text = "Temperatur"
            brewingLabelAbove.text = "Zeit"
        }
    }
    
    
    
    func setupNavBar() {
        title = passedbrewing.name
        
        let customFont = UIFont(name: "Staatliches-Regular", size: 40)
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: customFont ?? UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.bold) ]
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
            
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        backButton.tintColor = UIColor.black
        navigationItem.backBarButtonItem = backButton
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setupNavBar()

        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
     //Complain Buttons Tapped
    
    @IBAction func leftComplainButtonTapped(_ sender: UIButton) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ComplainViewController") as? ComplainViewController {
            if passedbrewing.name != "Bialetti" && passedbrewing.name != "Espresso" {
                vc.complain = complains[0]
                navigationController?.pushViewController(vc, animated: true)
            } else {
                vc.complain = complains[2]
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
    
    @IBAction func rightComplainButtonTapped(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ComplainViewController") as? ComplainViewController {
            if passedbrewing.name != "Bialetti" && passedbrewing.name != "Espresso" {
                vc.complain = complains[1]
                navigationController?.pushViewController(vc, animated: true)
            } else {
                vc.complain = complains[3]
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
    
    
    
    
}


extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        let arrayOfTips = passedbrewing.tips
        cell.tableViewCellLabel.text = arrayOfTips[indexPath.row]
        return cell
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arrayOfTips = passedbrewing.tips
        return arrayOfTips.count
        
    }
    
}

extension DetailViewController: UITableViewDelegate {
    
}

extension UINavigationController {
    override open var childForStatusBarHidden: UIViewController? {
        return self.topViewController
    }
}
