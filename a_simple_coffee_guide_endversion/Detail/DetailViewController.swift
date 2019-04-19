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
    
    var coffeetoobitter : [String : Any] = ["Complain":"coffee too bitter?", "Improvements": ["Take care not to use boiling water when making coffee. The ideal water temperature for most forms of preparation is 92°- 96°. If the water is hotter, the coffee tastes bitter", "The darker the coffee beans are roasted, the more bitter substances they contain. For financial reasons, coffee in industry is often very short and \"shock-roasted\" at very high temperatures. The coffee bean burns on the outside, while it is still almost raw on the inside. Tip: Use lighter roasts or pay attention to how your coffee was roasted", "A grinding degree that is too fine results in a coffee extraction time that is too long. This dissolves unwanted bitter substances.", "Robusta coffee has the characteristic to taste darker and more bitter than Arabica beans. So be aware of the bean type when choosing your coffee","Insufficient cleaning of your coffee accessories can cause your coffee to taste bitter. Check all parts that come into contact with coffee"]]
    
    var coffeetoosour : [String : Any] = ["Complain":"coffee too sour?", "Improvements": ["Coffee tastes sour if you leave it standing too long after it's brewed. This often happens when you brew too much coffee at once. Rule of thumb: 60g per 1 liter of water", "If the degree of grinding is too coarse, coffee can taste sour or aqueous because the coffee is extracted from the bottom. A sub-extraction results in the acids and not the bitter substances being dissolved from the coffee.", "Although we do not recommend using boiling water to make coffee, the water should not be too cold. The ideal temperature for your coffee water is 92°C - 96°C for most types of preparation. If your water is cooler than 85°C, the coffee tastes aqueous to sour. Depending on the temperature of the water, different aromas are released from the coffee. We therefore recommend letting the freshly boiled water stand for a minute or pouring it into another container immediately after boiling.","Wie du bereits merkst, hat das Wasser mit du deinen Kaffee aufbrühst einen erheblichen Einfluss auf den Geschmack deiner Tasse Kaffee. Verwendest du weiches Wasser (weit unter pH 7,0) kann dein Kaffee sauer schmecken.", "The coffee was roasted too light for your taste. Some Arabica varieties taste more fruity than others. If these are then lightly roasted according to the Scandinavian model, the natural fruit acids are not completely broken down.", "The coffee was roasted too hot. This often happens during roasting in the \"hot air process\", in which the coffee is shock-roasted at high temperatures for a short time. Thus the coffee bean chars almost from the outside while the acids inside are not completely decomposed. When the coffee is brewed, these acids then escape, which can lead to an acid taste." ]]
    
    var espressotoobitter : [String : Any] = ["Complain":"espresso too bitter?", "Improvements": ["Maybe you don't have the right bean for your taste. The roasting of the beans may be too dark for your taste. Robusta beans taste bitterer than Arabica beans. Perhaps the proportion of Robusta beans in your espresso is too high for your taste", "The grinding degree is too fine. Vary your grind and set it a bit coarser.", "The extraction time is too long. If your espresso powder comes into contact with the water for too long, the espresso will be over-extracted. A good espresso should run in 25 to 30 seconds", "The brewing pressure is too high (above 10 bar). If your machine allows it, you might want to adjust the brewing pressure of your machine and reduce it slightly", "The water's too hot. To be sure, you should measure the brewing temperature of the water (94°C)", "The ratio of water to espresso powder is not optimal. Too much espresso powder may have been used. As a rule of thumb use 7 g espresso per 20 ml water" ]]
    
    var espressotoosour : [String : Any] = ["Complain":"espresso too sour?", "Improvements": ["The coffee beans are too lightly roasted for your taste. The choice of the ideal espresso depends on your taste. Some roasts may simply be too light for your taste. Try a darker roast", "The grinding degree is too coarse. You can adjust the grind according to your taste. Usually, a too coarse grind produces a sour espresso.", "Die Extraktionszeit ist zu kurz. Die Zeit, in der der Espresso extrahiert wird sollte genauer untersucht werden. Probier‘ doch mal diese zu verlängern. Ein guter Espresso sollte in 25 bis 30 Sekunden durchlaufen", "The brewing pressure is too low (4-6 bar). Do you have an eye on the brewing pressure of your screen carrier machine? Vary the pressure with which the espresso is extracted","The water temperature is too low. With a thermometer, you can easily check whether the water has the ideal temperature, which should be around 94°C. ","The ratio of water to espresso powder is not optimal. Your espresso may taste too sour because too little espresso powder has been used (7 g espresso per cup)", "The water used is not suitable. The espresso consists of approx. 90% water, so the water is decisive. The mineral composition of the water can be unsuitable", "Error in the bean \"sour bean\" (defect). Sometimes defective coffee beans creep into the bag. They can make the cup of espresso undrinkable. With the next cup, your espresso could taste much better again."]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Setting Image and Name
        detailImageView.image = UIImage(named: passedbrewing.imageName)
        detailImageView.layer.cornerRadius = 8
        //chosenPreparationLabel.text = passedDict["Name"] as? String
        

        self.title = passedbrewing.name
        
        quantityLabel.text = passedbrewing.quantity
        temperatureLabel.text = passedbrewing.temperatur
        brewingLabel.text = passedbrewing.time
        
        if passedbrewing.name != "Bialetti Moka Pot" || passedbrewing.name != "Bialetti Moka Pot" {
            leftComplainButton.setTitle(coffeetoobitter["Complain"] as? String, for: .normal)
            rightComplainButton.setTitle(coffeetoosour["Complain"] as? String, for: .normal)
        } else {
            leftComplainButton.setTitle(espressotoobitter["Complain"] as? String, for: .normal)
            rightComplainButton.setTitle(espressotoosour["Complain"] as? String, for: .normal)
        }
        
        infoTableView.dataSource = self
        infoTableView.delegate = self
        
        firstSeparator.layer.cornerRadius = 1.5
        secondSeparator.layer.cornerRadius = 1.5
        thirdSeparator.layer.cornerRadius = 1.5
        
        self.infoTableView.rowHeight = UITableView.automaticDimension
        self.infoTableView.estimatedRowHeight = 82.0; // set to whatever your "average" cell height is
        
        
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
    
     //Complain Buttons Tapped
    
    @IBAction func leftComplainButtonTapped(_ sender: UIButton) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ComplainViewController") as? ComplainViewController {
            if passedbrewing.name != "Bialetti Moka Pot" || passedbrewing.name != "Bialetti Moka Pot" {
                vc.complainDict = coffeetoobitter
                navigationController?.pushViewController(vc, animated: true)
            } else {
                vc.complainDict = espressotoobitter
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
    
    @IBAction func rightComplainButtonTapped(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ComplainViewController") as? ComplainViewController {
            if passedbrewing.name != "Bialetti Moka Pot" || passedbrewing.name != "Bialetti Moka Pot" {
                vc.complainDict = coffeetoosour
                navigationController?.pushViewController(vc, animated: true)
            } else {
                vc.complainDict = espressotoosour
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
