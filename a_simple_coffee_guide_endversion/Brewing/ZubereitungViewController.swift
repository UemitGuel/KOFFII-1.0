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
    
//    var pourover : [String : Any] = ["Name": "Pour over", "Image": UIImage(named: "Handfilter")!, "Quantity": "32g/500ml", "Temp": "96°", "Time": "3-4min", "Tips": ["Nothing fancy here — just a good, solid technique", "Choose a medium grinding degree. Even extraction will help the coffee fully develop its aroma", "The ideal water temperature is 92-96°. Beside measuring temperature, you can just rest the boiling water for a minute", "After placing the paper filter, rinse it with boiled water to remove the slight taste of the paper filter and preheat the coffee pot. Pour the water out again", "For the last step of the preparation put the grounded coffee in the filter. Recommended are 32g coffee (about 3 full heaped tablespoons) per 500 ml water", "And now, Showtime: Start pouring water starting at the outer edge and move slowly in circular movements to the center until all the coffee powder is covered. As hot water hits the coffee, Co2 will be released and you will see the coffee rise up in masse - this is called blooming", "After 30 seconds of waiting and inhaling the coffee smell ( isn´t it normal? ) pour water into the filter just as you did in the last step. After, just add water in the middle to keep the water level", "Enjoy your coffee :)"]]
    
//    var bialetti : [String : Any] = ["Name": "Bialetti", "Image": UIImage(named: "Espressokocher")!, "Quantity": "Fill completely", "Temp": "medium heat", "Time": "-", "Tips": ["The Italian way", "Choose a medium grinding degree (slightly finer than for the pour over)", "Fill the bottom half of your Moka pot with boiled water, then fill the pot´s filter basket with the grounded coffee and shake it a bit for even distribution. Put everything together and place the pot on a stove", "Use medium to high heat, but be careful. If the temperature is too high the coffee will burn and lead to a bitter aftertaste", "Take the coffee off the stove when you hear a hissing sound and see coffee coming out continuously from the upper part. The residual heat will be enough, just wait a bit until there is no more coffee coming out", "Enjoy your coffee :)" ]]
//
//    var chemex : [String : Any] = ["Name": "Chemex", "Image": UIImage(named: "Chemex")!, "Quantity": "38g/600ml", "Temp": "96°", "Time": "4-5min", "Tips": ["You want your brewing process to be dramatic? - If your first reaction was \"Hell yes!\", continue reading...", "Choose a medium grinding degree (slightly coarser than for the pour over)", "Place your filter with the triple-fold portion facing the pour spout opening", "Rinse the filter with boiled water to remove the slight taste of the paper filter and preheat the vessel. Pour the water out through the pour spout", "Add your ground coffee and shake it gently for even distribution", "The ideal water temperature is 96°. Beside measuring temperature, you can just rest the boiling water for 30 - 60 seconds and then start pouring the water gently from the outer edge to the center in circular movements. As hot water hits the coffee, Co2 will be released and you will see the coffee rise up in masse - this is called blooming", "After waiting for 45 - 60 seconds and inhaling the coffee smell ( or is it just me? ) start pouring more water in the same way as before until all coffee powder is covered again. Allow the water to drip through the grounds until you see the liquid is just 2 - 3 cm over the bottom of the filter. Then fill it up again the same way until all water is used", "Remove the filter and swivel the carafe to mix the coffee", "Enjoy your coffee :)"]]
    
//    var frenchpress : [String : Any] = ["Name": "FrenchPress", "Image": UIImage(named: "Frenchpress")!, "Quantity": "65g/1l", "Temp": "96°", "Time": "4min", "Tips": ["la voie française", "Choose a medium grinding degree (slightly coarser than for the pour over)", "The ideal water temperature is 96°. Beside measuring temperature, you can just rest the boiling water for 30 - 60 seconds and then put twice the amount of water than you have coffee onto your grounds. Stir the ground gently to make sure every part gets in contact with the hot water, so the Co2 will be released and you can see the coffee rise up in masses - this is called blooming", "Allow the coffee to bloom for about 30 seconds before you pour the remaining water slowly on top and stir the water with the coffee once again. Let the magic happen for 4 minutes", "Press the filter down. If the plunger falls down immediately, your grind was too coarse. If it´s hard to press that means your grind was too fine. You shouldn´t let the coffee too long in there after", "Enjoy your coffee :)"]]
    
//    var aeropress : [String : Any] = ["Name": "Aeropress", "Image": UIImage(named: "Aeropress")!, "Quantity": "16g/200ml", "Temp": "90°", "Time": "1:30min", "Tips": ["The AeroPress was introduced to the coffee market from a company originally producing professional Frisbee discs. The ways of the Lord are inscrutable", "Choose a medium grinding degree (slightly finer than for the pour over)", "Rinse the filter with boiled water to remove the slight taste of paper filter", "Assemble the AeroPress. Push the plunger under the “4” marking of the cylinder", "Add your ground coffee and add twice the weight of hot water than you have grounds. The ideal water temperature is 90°. Beside measuring temperature, you can just rest the boiling water for 60 - 90 seconds. Stir the coffee a bit to ensure even distribution. As hot water hits the coffee, Co2 will be released and you will see the coffee rise up in masse - this is called blooming. Allow the coffee to bloom for about 30 seconds before you pour the remaining water on top until the AeroPress is filled", "Stir the coffee after another 30 seconds again. Then fasten the cap, flip the whole assembly fast but controlled and place it on a cup or jug. The coffee won´t leak out when you turned it due to the negative pressure created in the AeroPress piston", "Push the piston slowly and with even pressure down. If you barely can push it, you might grinded your coffee beans too fine. On the other hand, if the pushing fells to easy, your grind is likely too coarse. When your coffee begins to make a hissing sound you know it´s ready", "Unscrewed the cap, pop out the filter and push the piston through to the end and the condensed ground simply falls out", "Enjoy your coffee :)"]]
    
//    var espresso : [String : Any] = ["Name": "Espresso", "Image": UIImage(named: "Espresso")!, "Quantity": "18g/40ml", "Temp": "93-95°", "Time": "30sec", "Tips": ["The champions league of coffee making", "Choose a fine grinding degree", "Make sure the strainer holder is clean", "Put the ground coffee in the strainer holder and gently distribute it with your fingers", "Position your portafilter on a flat surface. Then use your tamper to evenly apply 15 - 20 kg pressure downward - that means you don´t have to turn green for this task, just enough to seal the coffee evenly. Give the tamper a soft spin in the end, so the ground gets an extra extraction", "Place the portafilter in the group head and you are ready to start your shot", "For the optimal experience, you should preheat your cup before putting it under the carrier opening. A good espresso should run though in 25 - 35 seconds", "Enjoy your espresso :)"]]
    
    var mocha : [String : Any] = ["Name": "Turkish Mocha", "Image": UIImage(named: "Turkish Mocha")!, "Quantity": "1 to 10 ratio", "Temp": "60°", "Time": "2min", "Tips": ["The most original way to make coffee", "Put 1 heavily heaped tsp of ground coffee (Mocha powder), with 1 cup of water and 1 tsp of sugar in a Turkish mocha pot, the so-called Cezva, stir it well and let the water boil", "Be careful: Remove the Cezva from the heat when the foam begins to rise towards the rim and before the coffee boils", "Without filtering, put the mocha and coffee grounds into the preheated cup", "Often the coffee is served with a small candy like baklava or other Turkish Delights", "Enjoy your mocha :) - p.s. make sure you avoid drinking the coffee grounds"]]
    
    
    
    var brewings = [Brewing]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
//        coffeedict.append(pourover)
//        coffeedict.append(bialetti)
//        coffeedict.append(chemex)
//        coffeedict.append(frenchpress)
//        coffeedict.append(aeropress)
//        coffeedict.append(espresso)
//        coffeedict.append(mocha)
//
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        brewings = [
            Brewing(name: "Pour over", imageName: "Handfilter", quantity: "32g/500ml", temperatur: "96°", time: "3-4min", tips: ["Nothing fancy here — just a good, solid technique", "Choose a medium grinding degree. Even extraction will help the coffee fully develop its aroma", "The ideal water temperature is 92-96°. Beside measuring temperature, you can just rest the boiling water for a minute", "After placing the paper filter, rinse it with boiled water to remove the slight taste of the paper filter and preheat the coffee pot. Pour the water out again", "For the last step of the preparation put the grounded coffee in the filter. Recommended are 32g coffee (about 3 full heaped tablespoons) per 500 ml water", "And now, Showtime: Start pouring water starting at the outer edge and move slowly in circular movements to the center until all the coffee powder is covered. As hot water hits the coffee, Co2 will be released and you will see the coffee rise up in masse - this is called blooming", "After 30 seconds of waiting and inhaling the coffee smell ( isn´t it normal? ) pour water into the filter just as you did in the last step. After, just add water in the middle to keep the water level", "Enjoy your coffee :)"]),
            Brewing(name: "Bialetti", imageName: "Espressokocher", quantity: "Fill completely", temperatur: "medium heat", time: "-", tips: ["The Italian way", "Choose a medium grinding degree (slightly finer than for the pour over)", "Fill the bottom half of your Moka pot with boiled water, then fill the pot´s filter basket with the grounded coffee and shake it a bit for even distribution. Put everything together and place the pot on a stove", "Use medium to high heat, but be careful. If the temperature is too high the coffee will burn and lead to a bitter aftertaste", "Take the coffee off the stove when you hear a hissing sound and see coffee coming out continuously from the upper part. The residual heat will be enough, just wait a bit until there is no more coffee coming out", "Enjoy your coffee :)" ]),
            Brewing(name: "Chemex", imageName: "Chemex", quantity: "38g/600ml", temperatur: "96°", time: "4-5min", tips: ["You want your brewing process to be dramatic? - If your first reaction was \"Hell yes!\", continue reading...", "Choose a medium grinding degree (slightly coarser than for the pour over)", "Place your filter with the triple-fold portion facing the pour spout opening", "Rinse the filter with boiled water to remove the slight taste of the paper filter and preheat the vessel. Pour the water out through the pour spout", "Add your ground coffee and shake it gently for even distribution", "The ideal water temperature is 96°. Beside measuring temperature, you can just rest the boiling water for 30 - 60 seconds and then start pouring the water gently from the outer edge to the center in circular movements. As hot water hits the coffee, Co2 will be released and you will see the coffee rise up in masse - this is called blooming", "After waiting for 45 - 60 seconds and inhaling the coffee smell ( or is it just me? ) start pouring more water in the same way as before until all coffee powder is covered again. Allow the water to drip through the grounds until you see the liquid is just 2 - 3 cm over the bottom of the filter. Then fill it up again the same way until all water is used", "Remove the filter and swivel the carafe to mix the coffee", "Enjoy your coffee :)"]),
            Brewing(name: "FrenchPress", imageName: "Frenchpress", quantity: "65g/1l", temperatur: "96°", time: "4min", tips: ["la voie française", "Choose a medium grinding degree (slightly coarser than for the pour over)", "The ideal water temperature is 96°. Beside measuring temperature, you can just rest the boiling water for 30 - 60 seconds and then put twice the amount of water than you have coffee onto your grounds. Stir the ground gently to make sure every part gets in contact with the hot water, so the Co2 will be released and you can see the coffee rise up in masses - this is called blooming", "Allow the coffee to bloom for about 30 seconds before you pour the remaining water slowly on top and stir the water with the coffee once again. Let the magic happen for 4 minutes", "Press the filter down. If the plunger falls down immediately, your grind was too coarse. If it´s hard to press that means your grind was too fine. You shouldn´t let the coffee too long in there after", "Enjoy your coffee :)"]),
            Brewing(name: "Aeropress", imageName: "Aeropress", quantity: "16g/200ml", temperatur: "90°", time: "1:30min", tips: ["The AeroPress was introduced to the coffee market from a company originally producing professional Frisbee discs. The ways of the Lord are inscrutable", "Choose a medium grinding degree (slightly finer than for the pour over)", "Rinse the filter with boiled water to remove the slight taste of paper filter", "Assemble the AeroPress. Push the plunger under the “4” marking of the cylinder", "Add your ground coffee and add twice the weight of hot water than you have grounds. The ideal water temperature is 90°. Beside measuring temperature, you can just rest the boiling water for 60 - 90 seconds. Stir the coffee a bit to ensure even distribution. As hot water hits the coffee, Co2 will be released and you will see the coffee rise up in masse - this is called blooming. Allow the coffee to bloom for about 30 seconds before you pour the remaining water on top until the AeroPress is filled", "Stir the coffee after another 30 seconds again. Then fasten the cap, flip the whole assembly fast but controlled and place it on a cup or jug. The coffee won´t leak out when you turned it due to the negative pressure created in the AeroPress piston", "Push the piston slowly and with even pressure down. If you barely can push it, you might grinded your coffee beans too fine. On the other hand, if the pushing fells to easy, your grind is likely too coarse. When your coffee begins to make a hissing sound you know it´s ready", "Unscrewed the cap, pop out the filter and push the piston through to the end and the condensed ground simply falls out", "Enjoy your coffee :)"]),
            Brewing(name: "Espresso", imageName: "Espresso", quantity: "18g/40ml", temperatur: "93-95°", time: "30sec", tips: ["The champions league of coffee making", "Choose a fine grinding degree", "Make sure the strainer holder is clean", "Put the ground coffee in the strainer holder and gently distribute it with your fingers", "Position your portafilter on a flat surface. Then use your tamper to evenly apply 15 - 20 kg pressure downward - that means you don´t have to turn green for this task, just enough to seal the coffee evenly. Give the tamper a soft spin in the end, so the ground gets an extra extraction", "Place the portafilter in the group head and you are ready to start your shot", "For the optimal experience, you should preheat your cup before putting it under the carrier opening. A good espresso should run though in 25 - 35 seconds", "Enjoy your espresso :)"]),
            Brewing(name: "Turkish Mocha", imageName: "Turkish Mocha", quantity: "1 to 10 ratio", temperatur: "60°", time: "2min", tips: ["The most original way to make coffee", "Put 1 heavily heaped tsp of ground coffee (Mocha powder), with 1 cup of water and 1 tsp of sugar in a Turkish mocha pot, the so-called Cezva, stir it well and let the water boil", "Be careful: Remove the Cezva from the heat when the foam begins to rise towards the rim and before the coffee boils", "Without filtering, put the mocha and coffee grounds into the preheated cup", "Often the coffee is served with a small candy like baklava or other Turkish Delights", "Enjoy your mocha :) - p.s. make sure you avoid drinking the coffee grounds"])
        ]
        
//            Candy(category:"Chocolate", name:"Chocolate Bar"),
//            Candy(category:"Chocolate", name:"Chocolate Chip"),
//            Candy(category:"Chocolate", name:"Dark Chocolate"),
//            Candy(category:"Hard", name:"Lollipop"),
//            Candy(category:"Hard", name:"Candy Cane"),
//            Candy(category:"Hard", name:"Jaw Breaker"),
//            Candy(category:"Other", name:"Caramel"),
//            Candy(category:"Other", name:"Sour Chew"),
//            Candy(category:"Other", name:"Gummi Bear"),
//            Candy(category:"Other", name:"Candy Floss"),
//            Candy(category:"Chocolate", name:"Chocolate Coin"),
//            Candy(category:"Chocolate", name:"Chocolate Egg"),
//            Candy(category:"Other", name:"Jelly Beans"),
//            Candy(category:"Other", name:"Liquorice"),
//            Candy(category:"Hard", name:"Toffee Apple")]
//
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}


extension ZubereitungViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brewings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrototypeCell", for: indexPath) as! ZubereitungTableViewCell
        let brewing : Brewing
        
        brewing = brewings[indexPath.row]
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
            brewing = brewings[indexPath.row]
            vc.passedbrewing = brewing
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

