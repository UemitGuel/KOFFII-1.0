//
//  ComplainViewController.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 14.03.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import UIKit

class ComplainViewController: UIViewController {
    
    @IBOutlet weak var complainLabel: UILabel!
    
    @IBOutlet weak var complainTableView: UITableView!
    
    
    // let var
    var complain = Complain(complain: "", improvements: [""])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        complainLabel.text = complain.complain
        
        complainTableView.dataSource = self
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = false
        
        self.complainTableView.rowHeight = UITableView.automaticDimension
        self.complainTableView.estimatedRowHeight = 82.0; // set to whatever your "average" cell height is

        }

}

extension ComplainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arrayOfImprovements = complain.improvements
        return arrayOfImprovements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComplainTableViewCell", for: indexPath) as! ComplainTableViewCell
        
        let arrayOfImprovements = complain.improvements
        cell.complainDetailLabel.text = arrayOfImprovements[indexPath.row]
        
        
        return cell
    }
    
    
}

extension ComplainViewController: UITableViewDelegate {
    
}
