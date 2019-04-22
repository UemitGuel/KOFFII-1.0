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
        setupNavBar()
        
        complainLabel.text = complain.complain
        
        complainTableView.dataSource = self
        
        self.complainTableView.rowHeight = UITableView.automaticDimension
        self.complainTableView.estimatedRowHeight = 82.0; // set to whatever your "average" cell height is

        }
    
    func setupNavBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.setNavigationBarHidden(false, animated: true)

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
        navigationController?.setNavigationBarHidden(true, animated: false)
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
