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
        
        cell.cellLabel.text = zubereitungsmöglichkeiten[indexPath.row]
        cell.ImageView.image = logoImage[indexPath.row]
        
        // getting border for the font in the tableviewcell
        let attributes: [NSAttributedString.Key : Any] = [.strokeWidth: -2.0, .strokeColor: UIColor.black]
        cell.cellLabel.attributedText = NSAttributedString(string: cell.cellLabel.text ?? "", attributes: attributes)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 156.5
    }
    
}

extension ZubereitungViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailViewSegue", sender: nil)
    }
}

