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
    @IBOutlet weak var DE_BarButtonItem: UIBarButtonItem!
    
    let searchController = UISearchController(searchResultsController: nil)
    var brewings = [Brewing]()
    var filteredBrewings = [Brewing]()
    
    struct GlobalVariable{
        static var EN_DE = "EN"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearch()
        setupNavBar()
        
        tableView.dataSource = self
        tableView.delegate = self
    
        setupLanguage()
    }
    
    func setupNavBar() {
        // eliminate 1pt line
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
    }
    
    func setupLanguage() {
        if GlobalVariable.EN_DE == "EN" {
            setupEN()
            DE_BarButtonItem.title = "DE"

        } else {
            setupDE()
            DE_BarButtonItem.title = "EN"

        }
    }
    
    func setupEN() {
        brewings = BrewingBank().listEng
        brewings = brewings.sorted { $0.name < $1.name }
        self.title = "Brewing"
        searchController.searchBar.placeholder = "Search.."

    }
    
    func setupDE() {
        brewings = BrewingBank().listGer
        self.title = "Zubereitung"
        searchController.searchBar.placeholder = "Suche.."

    }
    
    @IBAction func DE_BarButtonItemtapped(_ sender: UIBarButtonItem) {
        if GlobalVariable.EN_DE == "EN" {
            setupDE()
            GlobalVariable.EN_DE = "DE"
            DE_BarButtonItem.title = "EN"



        } else {
            setupEN()
            GlobalVariable.EN_DE = "EN"
            DE_BarButtonItem.title = "DE"


        }
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLanguage()
        tableView.reloadData()
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
        
        self.searchController.searchBar.setValue("X", forKey: "cancelButtonText")

    }
    
        
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredBrewings = brewings.filter({( brewing : Brewing) -> Bool in
            return brewing.tipsonestring.lowercased().contains(searchText.lowercased()) || brewing.name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }

    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }

    
}


extension ZubereitungViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredBrewings.count
        }
        
        return brewings.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrototypeCell", for: indexPath) as! ZubereitungTableViewCell
        let brewing : Brewing
        
        if isFiltering() {
            brewing = filteredBrewings[indexPath.row]
        } else {
            brewing = brewings[indexPath.row]
        }
        cell.cellLabel.text = brewing.name
        cell.ImageView.image = UIImage(named: brewing.imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}

extension ZubereitungViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            let brewing : Brewing
            if isFiltering() {
                brewing = filteredBrewings[indexPath.row]
                vc.passedbrewing = brewing
            } else {
                brewing = brewings[indexPath.row]
                vc.passedbrewing = brewing
            }
            parent?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ZubereitungViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)

    }
}
