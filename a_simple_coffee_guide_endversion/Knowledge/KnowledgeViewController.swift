//
//  KnowledgeViewController.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 17.03.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import UIKit

class KnowledgeViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

extension KnowledgeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KnowledgeTableViewCell", for: indexPath) as? KnowledgeTableViewCell
        return cell!
    }
    
    
}

extension KnowledgeViewController: UITableViewDelegate {
    
}

