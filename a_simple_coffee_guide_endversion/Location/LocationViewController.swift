//
//  LocationViewController.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 22.05.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import UIKit
import MessageUI

class LocationViewController: UIViewController {

    
    @IBOutlet weak var suggestionButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    

    // let/var
    var locations = [Location]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
       
        tableView.delegate = self
        tableView.dataSource = self
        populateTableView()
        
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        backButton.tintColor = UIColor.black
        navigationItem.backBarButtonItem = backButton
        
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [
                NSAttributedString.Key.font : UIFont(name: "Staatliches-Regular", size: 18)!,
                NSAttributedString.Key.foregroundColor : UIColor.black,
            ], for: .normal)
        
    }
    
    func setupNavBar() {
    // eliminate 1pt line
    self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    
    // Filling the Data
    
    func populateTableView() {
        locations = LocationBank().listCities
    }
    
    func showMailComposer() {
        
        guard MFMailComposeViewController.canSendMail() else {
            //Show alert informing the user
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["uemitgul@gmail.com"])
        composer.setSubject("You forgot this amazing coffee place!")
        composer.setMessageBody("Hi Ümit,\nCool app, but you should add XY Cafe in YZ to the list. They have...(wifi, food, vegan options, cake, plug?)\n\nAnd for the app, I would recommend you to ...", isHTML: false)
        
        present(composer, animated: true)
    }
    
    @IBAction func SuggestionButtonTapped(_ sender: UIBarButtonItem) {
        showMailComposer()
    }
    
    
}


extension LocationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as! LocationTableViewCell
        cell.selectionStyle = .none

        let location : Location
        location = locations[indexPath.row]
        cell.cellLabel.text = location.city
        cell.locationImageView.image = UIImage(named: location.imageName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}

extension LocationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CityViewController") as? CityViewController {
            let location : Location
            location = locations[indexPath.row]
            vc.passedlocation = location
            parent?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension LocationViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            //Show error alert
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed to send")
        case .saved:
            print("Saved")
        case .sent:
            print("Email Sent")
        }
        
        controller.dismiss(animated: true)
    }
}
