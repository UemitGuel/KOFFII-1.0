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
    @IBOutlet weak var DE_BarButtonItem: UIBarButtonItem!
    
    let searchController = UISearchController(searchResultsController: nil)
    var knowledges = [Knowledge]()
    var filteredKnowledges = [Knowledge]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearch()
        
        tableview.dataSource = self
        tableview.delegate = self
        
        setupLanguage()

        
        // eliminate 1pt line
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    func setupLanguage() {
        if ZubereitungViewController.GlobalVariable.EN_DE == "EN" {
            setupEN()
            DE_BarButtonItem.title = "DE"
        } else {
            setupDE()
            DE_BarButtonItem.title = "EN"
        }
    }
    
    
    func setupEN() {
        knowledges = KnowledgeBank().listEng
        self.title = "Knowledge"
        searchController.searchBar.placeholder = "Search.."

    }
    
    func setupDE() {
        knowledges = KnowledgeBank().listGer
        self.title = "Wissen"
        searchController.searchBar.placeholder = "Suche.."

    }
    
    @IBAction func DE_BarButtonItemtapped(_ sender: UIBarButtonItem) {
        if ZubereitungViewController.GlobalVariable.EN_DE == "EN" {
            setupDE()
            ZubereitungViewController.GlobalVariable.EN_DE = "DE"
            DE_BarButtonItem.title = "EN"
        } else {
            setupEN()
            ZubereitungViewController.GlobalVariable.EN_DE = "EN"
            DE_BarButtonItem.title = "DE"
        }
        tableview.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLanguage()
        tableview.reloadData()
    }
    
    
    

    func setupSearch() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search.."
        navigationItem.searchController = searchController
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.backgroundColor = .white
        searchController.searchBar.tintColor = .black
        definesPresentationContext = true
    }

    // MARK: - Private instance methods
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredKnowledges = knowledges.filter({( knowledge : Knowledge) -> Bool in
            return knowledge.name.lowercased().contains(searchText.lowercased()) ||
            knowledge.tipsonestring.lowercased().contains(searchText.lowercased())
        })
        
        tableview.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }

}


extension KnowledgeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredKnowledges.count
        }
        
        return knowledges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KnowledgeTableViewCell", for: indexPath) as! KnowledgeTableViewCell
        let knowledge : Knowledge
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        if isFiltering() {
            knowledge = filteredKnowledges[indexPath.row]
        } else {
            knowledge = knowledges[indexPath.row]
        }
        cell.cellLabel.text = knowledge.name
        cell.imageview.image = UIImage(named: knowledge.imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
}

extension KnowledgeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "OtherDetailViewController") as? OtherDetailViewController {
        let knowledge : Knowledge
        if isFiltering() {
            knowledge = filteredKnowledges[indexPath.row]
            vc.passedKnowledge = knowledge
        } else {
            knowledge = knowledges[indexPath.row]
            vc.passedKnowledge = knowledge
        }
        parent?.navigationController?.pushViewController(vc, animated: true)
    }
    }
}

extension KnowledgeViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
        
    }
}
