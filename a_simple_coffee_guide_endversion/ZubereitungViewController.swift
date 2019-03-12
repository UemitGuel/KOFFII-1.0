//
//  ZubereitungViewController.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 02.03.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import UIKit

class ZubereitungViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    // let var
    
    var pourover : [String : Any] = ["Name": "Pour over", "Image": UIImage(named: "Handfilter")!, "Quantity": "32g/500ml", "Temp": "96°", "Time": "3-4min", "Tips": ["Choose a medium grinding degree. This results in an even extraction and the coffee can fully develop its aroma.", "The ideal water temperature for most forms of preparation is 92 - 96 °C. Tip: After boiling, let the water rest for about one minute or pour it immediately into another container.", "Insert the paper filter into the hand filter. Rinse it with boiled water to remove the slight taste of the paper filter and preheat the cup or jug. Then pour the water out again.","Put the freshly ground coffee in the paper filter. We recommend that you use 32 g of coffee per 500 ml of water when preparing with the hand filter.", "Moisten the coffee powder with water until it is completely covered. Wait 30 seconds and watch as the coffee begins to soak - this is called blooming. The small bubbles that can now appear are gases that escape from the coffee. The ground coffee soaks up water, which favours extraction.", "After Blooming pour water over the hand filter. Slowly add the water in circular movements. Then pour only a thin jet in the middle to keep the water level in the filter. If you use a medium grind, the coffee should be ready after 3 - 4 minutes. Adjust the grind accordingly if your coffee is too long or too short.","1234"], "Complain1": "My coffee tastes bitter", "Complain2": "My coffee tastes sour"]
    
    var bialetti : [String : Any] = ["Name": "Bialetti Moka Pot", "Image": UIImage(named: "Espressokocher")!, "Quantity": "Fill completely", "Temp": "medium heat", "Time": "-", "Tips": ["First Tip", "Second Tip", "Third Tip"], "Complain1": "My Coffee is to bitter", "Complain2": "My coffee tastes sour"]
    
    var chemex : [String : Any] = ["Name": "Chemex", "Image": UIImage(named: "Chemex")!, "Quantity": "38g/600ml", "Temp": "96°", "Time": "4-5min", "Tips": ["First Tip", "Second Tip", "Third Tip"], "Complain1": "My Coffee is to bitter", "Complain2": "My coffee tastes sour"]
    
    var frenchpress : [String : Any] = ["Name": "French Press", "Image": UIImage(named: "Frenchpress")!, "Quantity": "65g/1l", "Temp": "96°", "Time": "4min", "Tips": ["First Tip", "Second Tip", "Third Tip"], "Complain1": "My Coffee is to bitter", "Complain2": "My coffee tastes sour"]
    
    var aeropress : [String : Any] = ["Name": "Aeropress", "Image": UIImage(named: "Aeropress")!, "Quantity": "16g/200ml", "Temp": "90°", "Time": "1:30min", "Tips": ["First Tip", "Second Tip", "Third Tip"], "Complain1": "My Coffee is to bitter", "Complain2": "My coffee tastes sour"]
    
    var espresso : [String : Any] = ["Name": "Espresso", "Image": UIImage(named: "Espresso")!, "Quantity": "18g/40ml", "Temp": "93-95°", "Time": "30sec", "Tips": ["First Tip", "Second Tip", "Third Tip"], "Complain1": "My Coffee is to bitter", "Complain2": "My coffee tastes sour"]
    
    var coffeedict = [[String:Any]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        coffeedict.append(pourover)
        coffeedict.append(bialetti)
        coffeedict.append(chemex)
        coffeedict.append(frenchpress)
        coffeedict.append(aeropress)
        coffeedict.append(espresso)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}


extension ZubereitungViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeedict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrototypeCell", for: indexPath) as! ZubereitungTableViewCell
        
        if let brew = coffeedict[indexPath.row]["Name"] as? String {
            cell.cellLabel!.text = brew
        }
    
        if let image = coffeedict[indexPath.row]["Image"] as? UIImage {
            cell.ImageView.image = image
        }
    
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 156.5
    }
    
}

extension ZubereitungViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.passedDict = coffeedict[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

