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
    
    var passedbrewing : Brewing = Brewing(name: "", imageName: "", quantity: "", temperatur: "", time: "", tips: [""])
    
    var complains = [Complain]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupNavBar()
        navigationController?.setNavigationBarHidden(false, animated: true)

        
        complains = [
            Complain(complain: "coffee too bitter?", improvements: ["If your grinding degree is too fine, the coffee extraction time will take too long and therefore your coffee can taste too bitter. Try a coarser grinding degree", "Make sure you don`t use boiling water for making your coffee, because it can lead to a bitter taste","Robusta coffee usually tastes darker and more bitter than Arabica beans", "For financial reasons, parts of the coffee industry are roasting the beans shortly at very high temperatures. This leads to beans which are burned outside, but still raw from the inside. Check the quality of your beans if you think your coffee is too bitter"]),
            Complain(complain: "coffee too sour?", improvements: ["If your grinding degree is too coarse, the coffee can taste too sour. Try a finer grinding degree", "If your water is cooling down too long, the coffee can taste sour. Try to use the freshly boiled water 60 seconds after letting it stand for a minute", "Some Arabica beans tasting more fruity. If these are then lightly roasted, the natural fruit acids are not completely broken down", "Coffee tastes can get sour if it is standing too long after it´s brewed", "If your water has a pH value under 7.0 your coffee can taste sour"]),
            Complain(complain: "espresso too bitter?", improvements: ["If your grinding degree is too fine, the espresso can taste too bitter. Try a coarser grinding degree", "The roasting of the beans may be too dark. Also consider, that Robusta beans taste bitterer than Arabica beans", "The brewing pressure could be too high (above 10 bar)", "A good espresso should run in 25 - 35 seconds. If it takes longer, the expresso will be over extracted", "Make sure you don`t use boiling water for making your espresso, because it can lead to a bitter taste", "Maybe you used too much espresso powder in relation to water"]),
            Complain(complain: "espresso too sour?", improvements: ["If your grinding degree is too coarse, the espresso can taste too sour. Try a finer grinding degree","Maybe you chose to lightly roasted coffee beans, try a darker roast", "The brewing pressure could be too low (under 6 bar)","A good espresso should run in 25 - 35 seconds. If it takes shorter, the expresso could taste sour", "If your water is cooling down too long, the coffee can taste sour", "Maybe you used to little espresso powder in relation to water"])
        ]
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
    
    func setupNavBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        title = passedbrewing.name
        
        let customFont = UIFont(name: "Staatliches-Regular", size: 40)
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: customFont ?? UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.bold) ]
            
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
        setupNavBar()
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = ""
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
