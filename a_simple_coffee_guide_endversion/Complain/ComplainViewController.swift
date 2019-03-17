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
    var complainDict = [String: Any]()
    var passedDict = [String : Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        complainLabel.text = complainDict["Complain"] as? String
        
        complainTableView.dataSource = self
        
        navigationController?.navigationBar.tintColor = .black
        
        self.complainTableView.rowHeight = UITableView.automaticDimension
        self.complainTableView.estimatedRowHeight = 82.0; // set to whatever your "average" cell height is

        }

}

extension ComplainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arrayOfImprovements = complainDict["Improvements"] as! [String]
        return arrayOfImprovements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComplainTableViewCell", for: indexPath) as! ComplainTableViewCell
        
        let arrayOfImprovements = complainDict["Improvements"] as! [String]
        cell.complainDetailLabel.text = arrayOfImprovements[indexPath.row]
        
        
        return cell
    }
    
    
}

extension ComplainViewController: UITableViewDelegate {
    
}
