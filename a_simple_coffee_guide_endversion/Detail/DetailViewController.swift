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
    
    func setupEN() {
        complains = [
            Complain(complain: "coffee too bitter?", improvements: ["If your grinding degree is too fine, the coffee extraction time will take too long and therefore your coffee can taste too bitter. Try a coarser grinding degree", "Make sure you don`t use boiling water for making your coffee, because it can lead to a bitter taste","Robusta coffee usually tastes darker and more bitter than Arabica beans", "For financial reasons, parts of the coffee industry are roasting the beans shortly at very high temperatures. This leads to beans which are burned outside, but still raw from the inside. Check the quality of your beans if you think your coffee is too bitter"]),
            Complain(complain: "coffee too sour?", improvements: ["If your grinding degree is too coarse, the coffee can taste too sour. Try a finer grinding degree", "If your water is cooling down too long, the coffee can taste sour. Try to use the freshly boiled water 60 seconds after letting it stand for a minute", "Some Arabica beans tasting more fruity. If these are then lightly roasted, the natural fruit acids are not completely broken down", "Coffee tastes can get sour if it is standing too long after it´s brewed", "If your water has a pH value under 7.0 your coffee can taste sour"]),
            Complain(complain: "espresso too bitter?", improvements: ["If your grinding degree is too fine, the espresso can taste too bitter. Try a coarser grinding degree", "The roasting of the beans may be too dark. Also consider, that Robusta beans taste bitterer than Arabica beans", "The brewing pressure could be too high (above 10 bar)", "A good espresso should run in 25 - 35 seconds. If it takes longer, the expresso will be over extracted", "Make sure you don`t use boiling water for making your espresso, because it can lead to a bitter taste", "Maybe you used too much espresso powder in relation to water"]),
            Complain(complain: "espresso too sour?", improvements: ["If your grinding degree is too coarse, the espresso can taste too sour. Try a finer grinding degree","Maybe you chose to lightly roasted coffee beans, try a darker roast", "The brewing pressure could be too low (under 6 bar)","A good espresso should run in 25 - 35 seconds. If it takes shorter, the expresso could taste sour", "If your water is cooling down too long, the coffee can taste sour", "Maybe you used to little espresso powder in relation to water"])
        ]
    }
    
    func setupDE() {
        complains = [
            Complain(complain: "Kaffee zu bitter?", improvements: ["Wenn der Mahlgrad zu fein ist, dauert die Kaffeeextraktionszeit zu lange und dein Kaffee kann daher zu bitter schmecken. Versuche ein gröberen Mahlgrad", "Achte darauf, dass du für die Zubereitung kein kochendes Wasser verwendst, da das zu einem bitteren Geschmack führen kann", "Robusta-Kaffee schmeckt in der Regel dunkler und bitterer als Arabica-Bohnen", "Aus finanziellen Gründen rösten Teile der Kaffeeindustrie die Bohnen nur kurz bei sehr hohen Temperaturen. Dies führt zu Bohnen, die außen verbrannt werden, aber von innen noch roh sind. Überprüfe die Qualität deiner Bohnen, wenn du der Meinung bist, dass dein Kaffee zu bitter ist"]),
            Complain(complain: "Kaffee zu sauer?", improvements: ["Wenn der Mahlgrad zu grob ist, kann der Kaffee zu sauer schmecken. Versuche einen feineren Mahlgrad", "Wenn das Wasser zu lange abkühlt, kann der Kaffee sauer schmecken. Versuche das frisch gekochte Wasser 60 Sekunden stehen zu lassen", "Einige Arabica-Bohnen schmecken fruchtiger. Werden diese dann leicht geröstet, werden die natürlichen Fruchtsäuren nicht vollständig abgebaut", "Der Kaffeegeschmack kann sauer werden, wenn der Kaffee zu lange steht", "Wenn das Wasser einen pH-Wert unter 7,0 hat, kann der Kaffee sauer schmecken"]),
            Complain(complain: "Espresso zu bitter?", improvements: ["Wenn der Mahlgrad zu fein ist, kann der Espresso zu bitter schmecken. Versuche einen gröberen Mahlgrad", "Die Röstung der Bohnen kann zu dunkel sein. Beachte auch, dass Robusta-Bohnen bitterer schmecken als Arabica-Bohnen", "Der Brühdruck kann zu hoch sein (über 10 bar)", "Ein guter Espresso sollte in 25 - 35 Sekunden laufen. Wenn es länger dauert, wird der Expresso übermäßig extrahiert", "Achte darauf, dass du für die Zubereitung deines Espressos kein kochendes Wasser verwendst, da dies zu einem bitteren Geschmack führen kann", "Vielleicht hast du zu viel Espressopulver in Bezug auf Wasser verwendet"]),
            Complain(complain: "Espresso zu sauer?", improvements: ["Wenn der Mahlgrad zu grob ist, kann der Espresso zu sauer schmecken. Versuche einen feineren Mahlgrad", "Vielleicht hast du dich für leicht geröstete Kaffeebohnen entschieden. Probieren einfach eine dunklere Röstung", "Der Brühdruck könnte zu niedrig sein (unter 6 bar)", "Ein guter Espresso sollte in 25 - 35 Sekunden laufen. Wenn es kürzer dauert, könnte der Expresso sauer schmecken", "Wenn das Wasser zu lange abkühlt, kann der Kaffee sauer schmecken", "Vielleicht hast du zu wenig Espressopulver in Bezug auf Wasser verwendet"])
        ]
    }
    
    func setupLanguage() {
        if ZubereitungViewController.GlobalVariable.EN_DE == "EN" {
            setupEN()
            quantityLabelAbove.text = "Quantity"
            temperatureLabelAbove.text = "Temperature"
            brewingLabelAbove.text = "Brewing Time"
        } else {
            setupDE()
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
