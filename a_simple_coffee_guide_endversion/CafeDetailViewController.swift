//
//  CafeDetailViewController.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 27.05.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import UIKit
import MapKit

class CafeDetailViewController: UIViewController {

    
    
    @IBOutlet weak var cityDetailImageView: UIImageView!
    
    @IBOutlet weak var cityDetailLabel: UILabel!
    
    @IBOutlet weak var map: MKMapView!
    
    //let/var
    var passedCafe = Cafe(name: "", image: "", features: [0,0,0,0,0])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
        cityDetailImageView.layer.cornerRadius = 8
        map.layer.cornerRadius = 8
                
        cityDetailImageView.image = UIImage(named: passedCafe.image)
        cityDetailLabel.text = "cool"
        
        
    }

    func setupNavBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        title = passedCafe.name

        let customFont = UIFont(name: "Staatliches-Regular", size: 40)
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: customFont ?? UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.bold) ]
        }
        
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        backButton.tintColor = UIColor.black
        navigationController?.navigationItem.backBarButtonItem = backButton

    }
    
    @IBAction func backButttonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
