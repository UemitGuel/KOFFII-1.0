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
    
    var pourover : [String : Any] = ["Name": "Pour over", "Image": UIImage(named: "Handfilter")!, "Quantity": "32g/500ml", "Temp": "96°", "Time": "3-4min", "Tips": ["Nothing fancy here — just a good, solid technique", "Choose a medium grinding degree. This results in an even extraction and the coffee can fully develop its aroma.", "The ideal water temperature for most forms of preparation is 92 - 96 °C. Tip: After boiling, let the water rest for about one minute or pour it immediately into another container.", "Insert the paper filter into the hand filter. Rinse it with boiled water to remove the slight taste of the paper filter and preheat the cup or jug. Then pour the water out again.","Put the freshly ground coffee in the paper filter. We recommend that you use 32 g of coffee per 500 ml of water when preparing with the hand filter.", "Moisten the coffee powder with water until it is completely covered. Wait 30 seconds and watch as the coffee begins to soak - this is called blooming. The small bubbles that can now appear are gases that escape from the coffee. The ground coffee soaks up water, which favours extraction.", "After Blooming pour water over the hand filter. Slowly add the water in circular movements. Then pour only a thin jet in the middle to keep the water level in the filter. If you use a medium grind, the coffee should be ready after 3 - 4 minutes. Adjust the grind accordingly if your coffee is too long or too short."]]
    
    var bialetti : [String : Any] = ["Name": "Bialetti Moka Pot", "Image": UIImage(named: "Espressokocher")!, "Quantity": "Fill completely", "Temp": "medium heat", "Time": "-", "Tips": ["Doing it the Italian way", "Choose a medium grinding degree (slightly finer than for the pour over)", "Boil water, and fill the bottom half of your Moka pot with water that’s fresh off the boil","Fill the pot’s filter basket with the ground coffee, and give it a shake to settle the grounds evenly. After placing it into the bottom compartment, screw on the Moka pot’s spouted top","Place the pot on a stove set to medium heat.", "Set the hob to medium to high heat. Temperatures that are too high burn the coffee and lead to a bitter aftertaste. You know it’s done when you hear a hissing, bubbling sound."]]
    
    var chemex : [String : Any] = ["Name": "Chemex", "Image": UIImage(named: "Chemex")!, "Quantity": "38g/600ml", "Temp": "96°", "Time": "4-5min", "Tips": ["You want your brewing process to be dramatic? Continue reading...", "Choose a medium grinding degree (slightly coarser than for the pour over)", "Unfold your filter and place it in your Chemex, ensuring that the triple-fold portion is facing the pour spout and lays across without obstructing it.","Fully saturate the filter and warm the vessel with hot water. Discard this water through the pour spout.","Pour your ground coffee into the filter and give it a gentle shake.","Wait 30 - 60 seconds after the water has boiled until the optimum infusion temperature of approx. 96° C is reached.", "First, moisten the coffee powder in the filter evenly with a small amount of water in circular movements. The aim is to ensure that the entire powder is softened while at the same time as little coffee as possible drips through the filter. You’ll notice that adding this amount of water causes the coffee to expand, or “bloom.” Allow it to do so for 45–55 seconds. A solid bloom ensures even saturation","Allow the water to drip through the grounds until the slurry drops 2-3 cm from the bottom of the filter","Pour water in a circular pattern starting in the center. Spiral out toward the edge of the slurry before spiraling back toward the middle. Avoid pouring on the filter.","Repeat the same pour pattern. The brew should have taken between 3.5–4.5 minutes. If the brew was too fast, consider using a finer grind or a slower pour rate next time. If the brew was too slow, consider using a coarser grind or a faster pour rate"], ]
    
    var frenchpress : [String : Any] = ["Name": "FrenchPress", "Image": UIImage(named: "Frenchpress")!, "Quantity": "65g/1l", "Temp": "96°", "Time": "4min", "Tips": ["The French Press is a full immersion coffee maker: the coffee powder is in continuous contact with the water before it is later separated by a filter.", "Choose a medium grinding degree (slightly coarser than for the pour over).", "To start, gently pour twice the amount of water than you have coffee onto your grounds.","Give the grounds a gentle stir with a bamboo paddle or chopstick. Allow the coffee to bloom for 30 seconds","Pour the remaining water and place the lid gently on top of the grounds. Don’t plunge just yet. Let the coffee steep for four minutes","Press the filter down. If it’s hard to press, that means your grind is too fine; if the plunger falls down immediately to the floor, it means your grind is too coarse","When you’ve finished pressing, serve the coffee immediately"]]
    
    var aeropress : [String : Any] = ["Name": "Aeropress", "Image": UIImage(named: "Aeropress")!, "Quantity": "16g/200ml", "Temp": "90°", "Time": "1:30min", "Tips": ["In 2006 the American company Aerobie, which originally produces professional Frisbee discs, introduced the AeroPress to the coffee market. The ways of the Lord are inscrutable", "Choose a medium grinding degree (slightly finer than for the pour over)", "Insert the filter and rinse it with hot water to rinse out the paper taste.","Now assemble the AeroPress so that the press piston is inserted into the brewing cylinder from below. In this way, the number labels of both elements are upside down (therefore this method is called “inverted methode”). Push the plunger so far in that the rubber seal reaches just under the “4” marking of the cylinder.", "Add your ground coffee. Be careful not to spill any grounds into the ring-shaped gutter at the top of the AeroPress.", "Start a timer. Add twice the weight of water than you have grounds","Stir the coffee evenly and make sure that you distribute the coffee well in the water.", "Pour in the remaining water of 200 ml until the AeroPress is filled. Then wait another half minute","can unscrew the filter together with the paper filter and close the AeroPress", "Fasten the cap, ensuring it locks into the grooves tightly. Flip the whole assembly over with haste and control. Position it atop your brew vessel and begin applying downward pressure. You will experience about 30 pounds of resistance here. If the pushing feels too easy, your grind is likely too coarse; if it’s very hard to push, chances are the grind is too fine. Your coffee is fully brewed once it begins to make a hissing sound. This means there is no more water to push through the device","If you now push the piston through to the end, the coffee flies out like a puck. Then just clean the rubber seal and put the AeroPress back on the shelf"]]
    
    var espresso : [String : Any] = ["Name": "Espresso", "Image": UIImage(named: "Espresso")!, "Quantity": "18g/40ml", "Temp": "93-95°", "Time": "30sec", "Tips": ["Chasing the ghost of perfection", "Cup to warm up. Knock out the coffee grounds and clean the strainer holder with a cloth. This step is often forgotten, but is essential, because during extraction coffee releases oils that negatively affect the taste of the next espresso", "Choose a fine grinding degree","Distribute the coffee by drawing a finger across it in a series of alternating swipes", "Place your portafilter on a clean, flat surface and position your tamper level on top of the grounds. Without driving your palm into the tamper’s base (which can cause gnarly wrist problems down the line), apply pressure downward. You don’t need to tamp incredibly hard—just enough to seal the coffee in evenly. Twenty to 30 pounds of pressure should do it. Give the tamper a gentle spin. This will smooth, or “polish,” the grounds for an even extraction.", "Position the portafilter in the grouphead and start your shot","The brewing head should be cleaned before using the strainer carrier. Let the hot water wash away all coffee residue for about three seconds. Now place the cup under the carrier opening and wait a few seconds. A good espresso should run through in 25 to 35 seconds. If it runs too fast or too slow, you should adjust the grind."]]
    
    var coffeedict = [[String:Any]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        coffeedict.append(pourover)
        coffeedict.append(bialetti)
        coffeedict.append(chemex)
        coffeedict.append(frenchpress)
        coffeedict.append(aeropress)
        coffeedict.append(espresso)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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


extension ZubereitungViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeedict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrototypeCell", for: indexPath) as! ZubereitungTableViewCell
        
        if let brew = coffeedict[indexPath.row]["Name"] as? String {
            cell.cellLabel!.text = brew
        }
    
        if let image = coffeedict[indexPath.row]["Image"] as? UIImage {
            cell.ImageView.image = image
        }
    
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
}

extension ZubereitungViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.passedDict = coffeedict[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

