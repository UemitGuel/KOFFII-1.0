//
//  CityViewController.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 22.05.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    
    @IBOutlet weak var wifiButton: RoundButton!
    
    @IBOutlet weak var foodButton: RoundButton!
    
    @IBOutlet weak var veganButton: RoundButton!
    
    @IBOutlet weak var cakeButton: RoundButton!
    
    @IBOutlet weak var plugButton: RoundButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // let/var
    var passedlocation : Location = Location(city: "", imageName: "", cafes: [Cafe(name: "", image: "", features: [""])], cafesOneString: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupButtons()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func setupNavBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        
        title = passedlocation.city
        
        let customFont = UIFont(name: "Staatliches-Regular", size: 40)
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: customFont ?? UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.bold) ]
        }
    }
    
    func setupButtons() {
        
        wifiButton.layer.cornerRadius = 0.5 * wifiButton.bounds.size.width
        foodButton.layer.cornerRadius = 0.5 * foodButton.bounds.size.width
        veganButton.layer.cornerRadius = 0.5 * veganButton.bounds.size.width
        cakeButton.layer.cornerRadius = 0.5 * cakeButton.bounds.size.width
        plugButton.layer.cornerRadius = 0.5 * plugButton.bounds.size.width
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setupNavBar()
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension CityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passedlocation.cafes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        cell.selectionStyle = .none

        cell.cafeImageView.image = UIImage(named: passedlocation.cafes[indexPath.row].image)
        cell.cityCellLabel.text = passedlocation.cafes[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
}

extension CityViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CafeDetailViewController") as? CafeDetailViewController {
            vc.passedCafe = passedlocation.cafes[indexPath.row]
                    
            let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            backButton.tintColor = UIColor.black
            
            let navigationControlleradded = UINavigationController(rootViewController: vc)
            
            navigationControlleradded.navigationItem.backBarButtonItem = backButton
            
            self.present(navigationControlleradded, animated: true, completion: nil)
            //navigationController?.pushViewController(vc, animated: true)

        }
    }
}

