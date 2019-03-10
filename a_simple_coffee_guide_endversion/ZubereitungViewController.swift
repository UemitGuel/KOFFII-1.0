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
    
    var pourover : [String : Any] = ["Name": "Pour over", "Image": UIImage(named: "Handfilter")!, "Quantity": "32g/500ml", "Temp": "96°", "Time": "3-4min", "Tips": ["First Tip", "Second Tip", "Third Tip"], "Complain1": "My Coffee is to bitter", "Complain2": "My coffee tastes sour"]
    
    var bialetti : [String : Any] = ["Name": "Bialetti Moka Pot", "Image": UIImage(named: "Espressokocher")!, "Quantity": "Fill completely", "Temp": "medium heat", "Time": "-", "Tips": ["First Tip", "Second Tip", "Third Tip"], "Complain1": "My Coffee is to bitter", "Complain2": "My coffee tastes sour"]
    
    var chemex : [String : Any] = ["Name": "Chemex", "Image": UIImage(named: "Chemex")!, "Quantity": "38g/600ml", "Temp": "96°", "Time": "4-5min", "Tips": ["First Tip", "Second Tip", "Third Tip"], "Complain1": "My Coffee is to bitter", "Complain2": "My coffee tastes sour"]
    
    var frenchpress : [String : Any] = ["Name": "French Press", "Image": UIImage(named: "Frenchpress")!, "Quantity": "65g/1l", "Temp": "96°", "Time": "4min", "Tips": ["First Tip", "Second Tip", "Third Tip"], "Complain1": "My Coffee is to bitter", "Complain2": "My coffee tastes sour"]
    
    var aeropress : [String : Any] = ["Name": "Aeropress", "Image": UIImage(named: "Aeropress")!, "Quantity": "16g/200ml", "Temp": "90°", "Time": "1:30min", "Tips": ["First Tip", "Second Tip", "Third Tip"], "Complain1": "My Coffee is to bitter", "Complain2": "My coffee tastes sour"]
    
    var espresso : [String : Any] = ["Name": "Espresso", "Image": UIImage(named: "Espresso")!, "Quantity": "18g/40ml", "Temp": "93-95°", "Time": "30sec", "Tips": ["First Tip", "Second Tip", "Third Tip"], "Complain1": "My Coffee is to bitter", "Complain2": "My coffee tastes sour"]
    
    var coffeedict = [[String:Any]]()
    
    
    
    let zubereitungsmöglichkeiten = ["Handfilter", "Espressokocher", "Chemex", "French Press"]
    
    var logoImage: [UIImage] = [
        UIImage(named: "Handfilter")!,
        UIImage(named: "Espressokocher")!,
        UIImage(named: "Chemex")!,
        UIImage(named: "Kaffee&Gesundheit")!
    ]
    
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
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailViewSegue" {
            let detailVC = segue.destination as! DetailViewController
            let index = tableView.indexPathForSelectedRow!.row
            let name = zubereitungsmöglichkeiten[index]
            let image = logoImage[index]
            detailVC.passedName = name
            detailVC.passedImage = image
            
        }
    }
    
}


extension ZubereitungViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return zubereitungsmöglichkeiten.count
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
            
            if let brew = coffeedict[indexPath.row]["Name"] as? String {
                vc.passedName = brew
            }
            
           if let image = coffeedict[indexPath.row]["Image"] as? UIImage {
            vc.passedImage = image
            }
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

