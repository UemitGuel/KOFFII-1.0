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
        
        tableView.dataSource = self
        tableView.delegate = self
    
        setupLanguage()
        
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
        brewings = [
            Brewing(name: "Pour over", imageName: "Handfilter", quantity: "32g/500ml", temperatur: "96°", time: "3-4min", tips: ["Nothing fancy here — just a good, solid technique", "Choose a medium grinding degree. Even extraction will help the coffee fully develop its aroma", "The ideal water temperature is 92-96°. Beside measuring temperature, you can just rest the boiling water for a minute", "After placing the paper filter, rinse it with boiled water to remove the slight taste of the paper filter and preheat the coffee pot. Pour the water out again", "For the last step of the preparation put the grounded coffee in the filter. Recommended are 32g coffee (about 3 full heaped tablespoons) per 500 ml water", "And now, Showtime: Start pouring water starting at the outer edge and move slowly in circular movements to the center until all the coffee powder is covered. As hot water hits the coffee, Co2 will be released and you will see the coffee rise up in masse - this is called blooming", "After 30 seconds of waiting and inhaling the coffee smell ( isn´t it normal? ) pour water into the filter just as you did in the last step. After, just add water in the middle to keep the water level", "Enjoy your coffee :)"], tipsonestring: "Nothing fancy here — just a good, solid technique Choose a medium grinding degree. Even extraction will help the coffee fully develop its aroma. The ideal water temperature is 92-96°. Beside measuring temperature, you can just rest the boiling water for a minute. After placing the paper filter, rinse it with boiled water to remove the slight taste of the paper filter and preheat the coffee pot. Pour the water out again. For the last step of the preparation put the grounded coffee in the filter. Recommended are 32g coffee (about 3 full heaped tablespoons) per 500 ml water. And now, Showtime: Start pouring water starting at the outer edge and move slowly in circular movements to the center until all the coffee powder is covered. As hot water hits the coffee, Co2 will be released and you will see the coffee rise up in masse - this is called blooming. After 30 seconds of waiting and inhaling the coffee smell ( isn´t it normal? ) pour water into the filter just as you did in the last step. After, just add water in the middle to keep the water level. Enjoy your coffee :)"),
            Brewing(name: "Bialetti", imageName: "Espressokocher", quantity: "Fill completely", temperatur: "medium heat", time: "-", tips: ["The Italian way", "Choose a medium grinding degree (slightly finer than for the pour over)", "Fill the bottom half of your Moka pot with boiled water, then fill the pot´s filter basket with the grounded coffee and shake it a bit for even distribution. Put everything together and place the pot on a stove", "Use medium to high heat, but be careful. If the temperature is too high the coffee will burn and lead to a bitter aftertaste", "Take the coffee off the stove when you hear a hissing sound and see coffee coming out continuously from the upper part. The residual heat will be enough, just wait a bit until there is no more coffee coming out", "Enjoy your coffee :)" ], tipsonestring: "The Italian way. Choose a medium grinding degree (slightly finer than for the pour over). Fill the bottom half of your Moka pot with boiled water, then fill the pot´s filter basket with the grounded coffee and shake it a bit for even distribution. Put everything together and place the pot on a stove. Use medium to high heat, but be careful. If the temperature is too high the coffee will burn and lead to a bitter aftertaste. Take the coffee off the stove when you hear a hissing sound and see coffee coming out continuously from the upper part. The residual heat will be enough, just wait a bit until there is no more coffee coming out. Enjoy your coffee :)"),
            Brewing(name: "Chemex", imageName: "Chemex", quantity: "38g/600ml", temperatur: "96°", time: "4-5min", tips: ["You want your brewing process to be dramatic? - If your first reaction was \"Hell yes!\", continue reading...", "Choose a medium grinding degree (slightly coarser than for the pour over)", "Place your filter with the triple-fold portion facing the pour spout opening", "Rinse the filter with boiled water to remove the slight taste of the paper filter and preheat the vessel. Pour the water out through the pour spout", "Add your ground coffee and shake it gently for even distribution", "The ideal water temperature is 96°. Beside measuring temperature, you can just rest the boiling water for 30 - 60 seconds and then start pouring the water gently from the outer edge to the center in circular movements. As hot water hits the coffee, Co2 will be released and you will see the coffee rise up in masse - this is called blooming", "After waiting for 45 - 60 seconds and inhaling the coffee smell ( or is it just me? ) start pouring more water in the same way as before until all coffee powder is covered again. Allow the water to drip through the grounds until you see the liquid is just 2 - 3 cm over the bottom of the filter. Then fill it up again the same way until all water is used", "Remove the filter and swivel the carafe to mix the coffee", "Enjoy your coffee :)"], tipsonestring: "You want your brewing process to be dramatic? - If your first reaction was \"Hell yes!\", continue reading.... Choose a medium grinding degree (slightly coarser than for the pour over). Place your filter with the triple-fold portion facing the pour spout opening. Rinse the filter with boiled water to remove the slight taste of the paper filter and preheat the vessel. Pour the water out through the pour spout. Add your ground coffee and shake it gently for even distribution. The ideal water temperature is 96°. Beside measuring temperature, you can just rest the boiling water for 30 - 60 seconds and then start pouring the water gently from the outer edge to the center in circular movements. As hot water hits the coffee, Co2 will be released and you will see the coffee rise up in masse - this is called blooming. After waiting for 45 - 60 seconds and inhaling the coffee smell ( or is it just me? ) start pouring more water in the same way as before until all coffee powder is covered again. Allow the water to drip through the grounds until you see the liquid is just 2 - 3 cm over the bottom of the filter. Then fill it up again the same way until all water is used. Remove the filter and swivel the carafe to mix the coffee. Enjoy your coffee :)"),
            Brewing(name: "French Press", imageName: "Frenchpress", quantity: "65g/1l", temperatur: "96°", time: "4min", tips: ["la voie française", "Choose a medium grinding degree (slightly coarser than for the pour over)", "The ideal water temperature is 96°. Beside measuring temperature, you can just rest the boiling water for 30 - 60 seconds and then put twice the amount of water than you have coffee onto your grounds. Stir the ground gently to make sure every part gets in contact with the hot water, so the Co2 will be released and you can see the coffee rise up in masses - this is called blooming", "Allow the coffee to bloom for about 30 seconds before you pour the remaining water slowly on top and stir the water with the coffee once again. Let the magic happen for 4 minutes", "Press the filter down. If the plunger falls down immediately, your grind was too coarse. If it´s hard to press that means your grind was too fine. You shouldn´t let the coffee too long in there after", "Enjoy your coffee :)"], tipsonestring: "la voie française. Choose a medium grinding degree (slightly coarser than for the pour over). The ideal water temperature is 96°. Beside measuring temperature, you can just rest the boiling water for 30 - 60 seconds and then put twice the amount of water than you have coffee onto your grounds. Stir the ground gently to make sure every part gets in contact with the hot water, so the Co2 will be released and you can see the coffee rise up in masses - this is called blooming. Allow the coffee to bloom for about 30 seconds before you pour the remaining water slowly on top and stir the water with the coffee once again. Let the magic happen for 4 minutes. Press the filter down. If the plunger falls down immediately, your grind was too coarse. If it´s hard to press that means your grind was too fine. You shouldn´t let the coffee too long in there after. Enjoy your coffee :)"),
            Brewing(name: "Aeropress", imageName: "Aeropress", quantity: "16g/200ml", temperatur: "90°", time: "1:30min", tips: ["The AeroPress was introduced to the coffee market from a company originally producing professional Frisbee discs. The ways of the Lord are inscrutable", "Choose a medium grinding degree (slightly finer than for the pour over)", "Rinse the filter with boiled water to remove the slight taste of paper filter", "Assemble the AeroPress. Push the plunger under the “4” marking of the cylinder", "Add your ground coffee and add twice the weight of hot water than you have grounds. The ideal water temperature is 90°. Beside measuring temperature, you can just rest the boiling water for 60 - 90 seconds. Stir the coffee a bit to ensure even distribution. As hot water hits the coffee, Co2 will be released and you will see the coffee rise up in masse - this is called blooming. Allow the coffee to bloom for about 30 seconds before you pour the remaining water on top until the AeroPress is filled", "Stir the coffee after another 30 seconds again. Then fasten the cap, flip the whole assembly fast but controlled and place it on a cup or jug. The coffee won´t leak out when you turned it due to the negative pressure created in the AeroPress piston", "Push the piston slowly and with even pressure down. If you barely can push it, you might grinded your coffee beans too fine. On the other hand, if the pushing fells to easy, your grind is likely too coarse. When your coffee begins to make a hissing sound you know it´s ready", "Unscrewed the cap, pop out the filter and push the piston through to the end and the condensed ground simply falls out", "Enjoy your coffee :)"], tipsonestring: "The AeroPress was introduced to the coffee market from a company originally producing professional Frisbee discs. The ways of the Lord are inscrutable. Choose a medium grinding degree (slightly finer than for the pour over). Rinse the filter with boiled water to remove the slight taste of paper filter. Assemble the AeroPress. Push the plunger under the “4” marking of the cylinder. Add your ground coffee and add twice the weight of hot water than you have grounds. The ideal water temperature is 90°. Beside measuring temperature, you can just rest the boiling water for 60 - 90 seconds. Stir the coffee a bit to ensure even distribution. As hot water hits the coffee, Co2 will be released and you will see the coffee rise up in masse - this is called blooming. Allow the coffee to bloom for about 30 seconds before you pour the remaining water on top until the AeroPress is filled. Stir the coffee after another 30 seconds again. Then fasten the cap, flip the whole assembly fast but controlled and place it on a cup or jug. The coffee won´t leak out when you turned it due to the negative pressure created in the AeroPress piston. Push the piston slowly and with even pressure down. If you barely can push it, you might grinded your coffee beans too fine. On the other hand, if the pushing fells to easy, your grind is likely too coarse. When your coffee begins to make a hissing sound you know it´s ready. Unscrewed the cap, pop out the filter and push the piston through to the end and the condensed ground simply falls out. Enjoy your coffee :)"),
            Brewing(name: "Espresso", imageName: "Espresso", quantity: "18g/40ml", temperatur: "93-95°", time: "30sec", tips: ["The champions league of coffee making", "Choose a fine grinding degree", "Make sure the strainer holder is clean", "Put the ground coffee in the strainer holder and gently distribute it with your fingers", "Position your portafilter on a flat surface. Then use your tamper to evenly apply 15 - 20 kg pressure downward - that means you don´t have to turn green for this task, just enough to seal the coffee evenly. Give the tamper a soft spin in the end, so the ground gets an extra extraction", "Place the portafilter in the group head and you are ready to start your shot", "For the optimal experience, you should preheat your cup before putting it under the carrier opening. A good espresso should run though in 25 - 35 seconds", "Enjoy your espresso :)"], tipsonestring: "The champions league of coffee making. Choose a fine grinding degree. Make sure the strainer holder is clean. Put the ground coffee in the strainer holder and gently distribute it with your fingers. Position your portafilter on a flat surface. Then use your tamper to evenly apply 15 - 20 kg pressure downward - that means you don´t have to turn green for this task, just enough to seal the coffee evenly. Give the tamper a soft spin in the end, so the ground gets an extra extraction. Place the portafilter in the group head and you are ready to start your shot. For the optimal experience, you should preheat your cup before putting it under the carrier opening. A good espresso should run though in 25 - 35 seconds. Enjoy your espresso :)"),
            Brewing(name: "Turkish Mocha", imageName: "Turkish Mocha", quantity: "1 to 10 ratio", temperatur: "60°", time: "2min", tips: ["The most original way to make coffee", "Put 1 heavily heaped tsp of ground coffee (Mocha powder), with 1 cup of water and 1 tsp of sugar in a Turkish mocha pot, the so-called Cezva, stir it well and let the water boil", "Be careful: Remove the Cezva from the heat when the foam begins to rise towards the rim and before the coffee boils", "Without filtering, put the mocha and coffee grounds into the preheated cup", "Often the coffee is served with a small candy like baklava or other Turkish Delights", "Enjoy your mocha :) - p.s. make sure you avoid drinking the coffee grounds"], tipsonestring: "The most original way to make coffee. Put 1 heavily heaped tsp of ground coffee (Mocha powder), with 1 cup of water and 1 tsp of sugar in a Turkish mocha pot, the so-called Cezva, stir it well and let the water boil. Be careful: Remove the Cezva from the heat when the foam begins to rise towards the rim and before the coffee boils. Without filtering, put the mocha and coffee grounds into the preheated cup. Often the coffee is served with a small candy like baklava or other Turkish Delights. Enjoy your mocha :) - p.s. make sure you avoid drinking the coffee grounds"),
        ]
        brewings = brewings.sorted { $0.name < $1.name }
        self.title = "Brewing"

    }
    
    func setupDE() {
        brewings = [
            Brewing(name: "Aeropress", imageName: "Aeropress", quantity: "16g/200ml", temperatur: "90°", time: "1:30min", tips: ["Die AeroPress wurde von einem Unternehmen das ursprünglich professionelle Frisbee Discs herstellt auf den Kaffeemarkt gebracht. Die Wege des Herrn sind unergründlich", "Wähle einen mittleren Mahlgrad (etwas feiner als beim Filterkaffee)", "Spüle den Filter mit kochendem Wasser durch, um den leichten Eigengeschmack des Papierfilters zu entfernen", "Montiere die AeroPress. Drücke den Kolben unter die Markierung \"4\" des Zylinders", "Füge deinen gemahlenen Kaffee und das Doppelte des Gewichts an heißem Wasser hinzu. Die ideale Wassertemperatur beträgt 90°. Neben der Temperaturmessung kannst du das kochende Wasser auch einfach für 60 - 90 Sekunden ruhen lassen. Rühre den Kaffee ein wenig um, um eine gleichmäßige Verteilung zu gewährleisten. Wenn heißes Wasser auf den Kaffee trifft, wird Co2 freigesetzt und der Kaffee beginnt aufzublühen - das nennt man Blooming. Lasse den Kaffee ca. 30 Sekunden aufblühen, bevor du das restliche Wasser aufgießt bis die AeroPress gefüllt ist","Rühre den Kaffee nach weiteren 30 Sekunden wieder um. Dann befestige den Deckel, drehe die gesamte Baugruppe schnell und kontrolliert um und stell sie auf eine Tasse oder einen Krug. Aufgrund des Unterdrucks im AeroPress-Kolben tritt der Kaffee nicht aus wenn du es drehst", "Drücke den Kolben langsam und mit gleichmäßigem Druck nach unten. Wenn du es kaum schieben kannst, war der Mahlgrad zu fein. Andererseits, wenn der Druck zu leicht fällt, ist der Mahlgrad zu grob gewesen. Wenn Ihr Kaffee beginnt, ein zischendes Geräusch zu machen, weißt du der Kaffee ist bereit", "Wenn du die Kappe abschraubst und den Kolben bis zum Ende durchschiebst fliegt der Kaffee wie ein Puck heraus", "Genieße deinen Kaffee :)"], tipsonestring: "Die AeroPress wurde von einem Unternehmen das ursprünglich professionelle Frisbee Discs herstellt auf den Kaffeemarkt gebracht. Die Wege des Herrn sind unergründlich. Wähle einen mittleren Mahlgrad (etwas feiner als beim Filterkaffee). Spüle den Filter mit kochendem Wasser durch, um den leichten Eigengeschmack des Papierfilters zu entfernen. Montiere die AeroPress. Drücke den Kolben unter die Markierung \"4\" des Zylinders. Füge deinen gemahlenen Kaffee und das Doppelte des Gewichts an heißem Wasser hinzu. Die ideale Wassertemperatur beträgt 90°. Neben der Temperaturmessung kannst du das kochende Wasser auch einfach für 60 - 90 Sekunden ruhen lassen. Rühre den Kaffee ein wenig um, um eine gleichmäßige Verteilung zu gewährleisten. Wenn heißes Wasser auf den Kaffee trifft, wird Co2 freigesetzt und der Kaffee beginnt aufzublühen - das nennt man Blooming. Lasse den Kaffee ca. 30 Sekunden aufblühen, bevor du das restliche Wasser aufgießt bis die AeroPress gefüllt ist. Rühre den Kaffee nach weiteren 30 Sekunden wieder um. Dann befestige den Deckel, drehe die gesamte Baugruppe schnell und kontrolliert um und stell sie auf eine Tasse oder einen Krug. Aufgrund des Unterdrucks im AeroPress-Kolben tritt der Kaffee nicht aus wenn du es drehst. Drücke den Kolben langsam und mit gleichmäßigem Druck nach unten. Wenn du es kaum schieben kannst, war der Mahlgrad zu fein. Andererseits, wenn der Druck zu leicht fällt, ist der Mahlgrad zu grob gewesen. Wenn Ihr Kaffee beginnt, ein zischendes Geräusch zu machen, weißt du der Kaffee ist bereit. Wenn du die Kappe abschraubst und den Kolben bis zum Ende durchschiebst fliegt der Kaffee wie ein Puck heraus. Genieße deinen Kaffee :)"),
            Brewing(name: "Bialetti", imageName: "Espressokocher", quantity: "Komplett füllen", temperatur: "Mittlere Temp", time: "-", tips: ["Die italienische Art", "Wähle einen mittleren Mahlgrad (etwas feiner als beim Filterkaffee)", "Fülle die untere Hälfte der Mokka-Kanne mit gekochtem Wasser, fülle dann den Filter mit dem gemahlenen Kaffee. Setze jetzt alles zusammen und stelle die Mokka-Kanne auf den Herd", "Verwende mittlere bis hohe Temperaturen. Aber Vorsicht, bei zu hoher Temperatur verbrennt der Kaffee und führt zu einem bitteren Nachgeschmack", "Nehme den Kaffee vom Herd wenn du ein zischendes Geräusch hörst und siehst, wie der Kaffee kontinuierlich aus dem oberen Teil austritt. Die Restwärme reicht aus, warte einfach ein wenig bis kein Kaffee mehr austritt", "Genieße deinen Kaffee :)"], tipsonestring: "Die italienische Art. Wähle einen mittleren Mahlgrad (etwas feiner als beim Filterkaffee). Fülle die untere Hälfte der Mokka-Kanne mit gekochtem Wasser, fülle dann den Filter mit dem gemahlenen Kaffee. Setze jetzt alles zusammen und stelle die Mokka-Kanne auf den Herd. Verwende mittlere bis hohe Temperaturen. Aber Vorsicht, bei zu hoher Temperatur verbrennt der Kaffee und führt zu einem bitteren Nachgeschmack. Nehme den Kaffee vom Herd wenn du ein zischendes Geräusch hörst und siehst, wie der Kaffee kontinuierlich aus dem oberen Teil austritt. Die Restwärme reicht aus, warte einfach ein wenig bis kein Kaffee mehr austritt. Genieße deinen Kaffee :)"),
            Brewing(name: "Chemex", imageName: "Chemex", quantity: "38g/600ml", temperatur: "96°", time: "4-5min", tips: ["Du möchtest, dass deine Kaffeezubereitung dramatisch ist? - Dann lies weiter...", "Wähle einen mittleren Mahlgrad (etwas gröber als beim Filterkaffee)", "Platziere den Filter so, dass der dreifach gefaltete Teil zur Ausgussöffnung zeigt", "Spüle den Filter mit gekochtem Wasser durch, um den leichten Eigengeschmack des Papierfilters zu entfernen und um die Kaffeekanne vorzuwärmen. Schütte das Wasser anschließend wieder aus","Füge den gemahlenen Kaffee hinzu und schüttel ihn vorsichtig, damit er gleichmäßig verteilt wird", "Die ideale Wassertemperatur beträgt 96°. Neben der Temperaturmessung kannst du das kochende Wasser auch einfach für 30 - 60 Sekunden ruhen lassen und dann mit kreisförmigen Bewegungen sanft von der Außenkante zur Mitte gießen. Wenn heißes Wasser auf den Kaffee trifft, wird Co2 freigesetzt und der Kaffee beginnt aufzublühen - das nennt man Blooming", "Nach 45 - 60 Sekunden des Wartens und Einatmens des Kaffeegeruchs (oder bin das nur ich?) kannst du wie bisher mehr Wasser zu gießen, bis das gesamte Kaffeepulver wieder bedeckt ist. Lass das Wasser durch den Boden tropfen, bis du siehst, dass die Flüssigkeit nur 2 - 3 cm über dem Boden des Filters liegt. Dann kannst du es wieder auf die gleiche Weise auffüllen, bis das gesamte Wasser verbraucht ist", "Entferne den Filter und schwenke die Karaffe ein bisschen um den Kaffee zu mischen", "Genieße deinen Kaffee :)"], tipsonestring: "Du möchtest, dass deine Kaffeezubereitung dramatisch ist? - Dann lies weiter.... Wähle einen mittleren Mahlgrad (etwas gröber als beim Filterkaffee). Platziere den Filter so, dass der dreifach gefaltete Teil zur Ausgussöffnung zeigt. Spüle den Filter mit gekochtem Wasser durch, um den leichten Eigengeschmack des Papierfilters zu entfernen und um die Kaffeekanne vorzuwärmen. Schütte das Wasser anschließend wieder aus. Füge den gemahlenen Kaffee hinzu und schüttel ihn vorsichtig, damit er gleichmäßig verteilt wird. Die ideale Wassertemperatur beträgt 96°. Neben der Temperaturmessung kannst du das kochende Wasser auch einfach für 30 - 60 Sekunden ruhen lassen und dann mit kreisförmigen Bewegungen sanft von der Außenkante zur Mitte gießen. Wenn heißes Wasser auf den Kaffee trifft, wird Co2 freigesetzt und der Kaffee beginnt aufzublühen - das nennt man Blooming. Nach 45 - 60 Sekunden des Wartens und Einatmens des Kaffeegeruchs (oder bin das nur ich?) kannst du wie bisher mehr Wasser zu gießen, bis das gesamte Kaffeepulver wieder bedeckt ist. Lass das Wasser durch den Boden tropfen, bis du siehst, dass die Flüssigkeit nur 2 - 3 cm über dem Boden des Filters liegt. Dann kannst du es wieder auf die gleiche Weise auffüllen, bis das gesamte Wasser verbraucht ist. Entferne den Filter und schwenke die Karaffe ein bisschen um den Kaffee zu mischen. Genieße deinen Kaffee :)"),
            Brewing(name: "Espresso", imageName: "Espresso", quantity: "18g/40ml", temperatur: "93-95°", time: "30sek", tips: ["Die Champions League der Kaffeezubereitung", "Wähle einen feineren Mahlgrad", "Vergewisser dich, dass der Siebhalter sauber ist", "Gebe den gemahlenen Kaffee in den Siebhalter und verteilen ihn mit den Fingern vorsichtig", "Positioniere den Portafilter auf einer ebenen Fläche. Dann übe mit dem Tamper 15 - 20 kg Druck gleichmäßig nach unten aus - das bedeutet nicht, dass du für diese Aufgabe zum Hulk werden musst. Nur genug Kraft, um den Kaffee gleichmäßig zu verschließen", "Positioniere den Portafilter in der Maschine", "Für ein optimales Erlebnis solltest du deine Tasse vorheizen, bevor du sie unter die Trägeröffnung stellst. Ein guter Espresso sollte in 25 - 35 Sekunden durchlaufen", "Genieße deinen Espresso :)"], tipsonestring: "Die Champions League der Kaffeezubereitung. Wähle einen feineren Mahlgrad. Vergewisser dich, dass der Siebhalter sauber ist. Gebe den gemahlenen Kaffee in den Siebhalter und verteilen ihn mit den Fingern vorsichtig. Positioniere den Portafilter auf einer ebenen Fläche. Dann übe mit dem Tamper 15 - 20 kg Druck gleichmäßig nach unten aus - das bedeutet nicht, dass du für diese Aufgabe zum Hulk werden musst. Nur genug Kraft, um den Kaffee gleichmäßig zu verschließen. Positioniere den Portafilter in der Maschine. Für ein optimales Erlebnis solltest du deine Tasse vorheizen, bevor du sie unter die Trägeröffnung stellst. Ein guter Espresso sollte in 25 - 35 Sekunden durchlaufen. Genieße deinen Espresso :)"),
            Brewing(name: "French Press", imageName: "Frenchpress", quantity: "65g/1l", temperatur: "96°", time: "4min", tips: ["la voie française", "Wähle einen mittleren Mahlgrad (etwas gröber als beim Filterkaffee)", "Die ideale Wassertemperatur beträgt 96°. Neben der Temperaturmessung kannst du das kochende Wasser auch einfach für 30 - 60 Sekunden ruhen lassen. Nachdem du den Kaffee in die French Press geschüttet hast, kannst du die doppelte Menge an Wasser hinzufügen. Rühre den Boden vorsichtig um, um sicherzustellen, dass jedes Teil mit dem heißen Wasser in Berührung kommt. Wenn heißes Wasser auf den Kaffee trifft, wird Co2 freigesetzt und der Kaffee beginnt aufzublühen - das nennt man Blooming", "Lasse den Kaffee ca. 30 Sekunden aufblühen, bevor du das restliche Wasser langsam darüber gießt und das Wasser noch einmal mit dem Kaffee umrührst. Lass die Magie 4 Minuten lang geschehen", "Drücke den Filter nun nach unten. Wenn der Kolben sofort herunterfällt, war der Mahlgrad zu grob. Wenn es schwer zu drücken ist, bedeutet das, dass der Mahlgrad zu fein war. Lass den fertigen Kaffee nicht zu lange in der French Press stehen", "Genieße deinen Kaffee :)"], tipsonestring: "la voie française. Wähle einen mittleren Mahlgrad (etwas gröber als beim Filterkaffee). Die ideale Wassertemperatur beträgt 96°. Neben der Temperaturmessung kannst du das kochende Wasser auch einfach für 30 - 60 Sekunden ruhen lassen. Nachdem du den Kaffee in die French Press geschüttet hast, kannst du die doppelte Menge an Wasser hinzufügen. Rühre den Boden vorsichtig um, um sicherzustellen, dass jedes Teil mit dem heißen Wasser in Berührung kommt. Wenn heißes Wasser auf den Kaffee trifft, wird Co2 freigesetzt und der Kaffee beginnt aufzublühen - das nennt man Blooming. Lasse den Kaffee ca. 30 Sekunden aufblühen, bevor du das restliche Wasser langsam darüber gießt und das Wasser noch einmal mit dem Kaffee umrührst. Lass die Magie 4 Minuten lang geschehen. Drücke den Filter nun nach unten. Wenn der Kolben sofort herunterfällt, war der Mahlgrad zu grob. Wenn es schwer zu drücken ist, bedeutet das, dass der Mahlgrad zu fein war. Lass den fertigen Kaffee nicht zu lange in der French Press stehen. Genieße deinen Kaffee :)"),
            Brewing(name: "Filterkaffee", imageName: "Handfilter", quantity: "32g/500ml", temperatur: "96°", time: "3-4min", tips: ["Nichts zu Verrücktes - nur eine gute, solide Technik", "Wähle einen mittleren Mahlgrad", "Die ideale Wassertemperatur beträgt 92-96°. Neben der Temperaturmessung kannst du das kochende Wasser auch einfach für eine Minute ruhen lassen", "Nach dem der Papierfilter eingesetzt ist, spüle ihn mit gekochtem Wasser durch, um den leichten Eigengeschmack des Papierfilters zu entfernen und um die Kaffeekanne vorzuwärmen. Schütte das Wasser anschließend wieder aus", "Im letzten Schritt gebe den gemahlenen Kaffee in den Filter. Empfohlen werden 32g Kaffee (ca. 3 vollgepackte Esslöffel) pro 500 ml Wasser", "Und jetzt, Showtime: Beginne mit dem Aufgießen von Wasser, beginnend am äußeren Rand, und bewege dich langsam in kreisförmigen Bewegungen zur Mitte, bis das gesamte Kaffeepulver bedeckt ist. Wenn heißes Wasser auf den Kaffee trifft, wird Co2 freigesetzt und der Kaffee beginnt aufzublühen - das nennt man Blooming", "Nach dem du 30 Sekunden lang den Kaffeegeruch eingeatmet hast (ist das nicht normal?) kannst du weiteres Wasser in den Filter gießen, genau wie im letzten Schritt. Danach einfach zeitweise Wasser in der Mitte hinzufügen, um den Wasserstand zu halten", "Genieße deinen Kaffee :)"], tipsonestring: "Nichts zu Verrücktes - nur eine gute, solide Technik. Wähle einen mittleren Mahlgrad. Die ideale Wassertemperatur beträgt 92-96°. Neben der Temperaturmessung kannst du das kochende Wasser auch einfach für eine Minute ruhen lassen. Nach dem der Papierfilter eingesetzt ist, spüle ihn mit gekochtem Wasser durch, um den leichten Eigengeschmack des Papierfilters zu entfernen und um die Kaffeekanne vorzuwärmen. Schütte das Wasser anschließend wieder aus. Im letzten Schritt gebe den gemahlenen Kaffee in den Filter. Empfohlen werden 32g Kaffee (ca. 3 vollgepackte Esslöffel) pro 500 ml Wasser. Und jetzt, Showtime: Beginne mit dem Aufgießen von Wasser, beginnend am äußeren Rand, und bewege dich langsam in kreisförmigen Bewegungen zur Mitte, bis das gesamte Kaffeepulver bedeckt ist. Wenn heißes Wasser auf den Kaffee trifft, wird Co2 freigesetzt und der Kaffee beginnt aufzublühen - das nennt man Blooming. Nach dem du 30 Sekunden lang den Kaffeegeruch eingeatmet hast (ist das nicht normal?) kannst du weiteres Wasser in den Filter gießen, genau wie im letzten Schritt. Danach einfach zeitweise Wasser in der Mitte hinzufügen, um den Wasserstand zu halten. Genieße deinen Kaffee :)"),
            Brewing(name: "Türkischer Mokka", imageName: "Turkish Mocha", quantity: "1 zu 10", temperatur: "60°", time: "2min", tips: ["Die originale Art Kaffee zuzubereiten", "Gebe 1 stark gehäuften Teelöffel gemahlenen Kaffee (Mokka-Pulver) mit 1 Tasse Wasser und 1 Teelöffel Zucker in eine türkische Mokkatopf, den sogenannten Cezva, rühr alles gut um und lass das Wasser kochen", "Sei vorsichtig: Entferne den Cezva vom Herd, wenn der Schaum zum Rand hin ansteigt und der Kaffee kocht", "Ohne zu filtern, gebe den gesamten Mokka in die vorgewärmte Tasse", "Oft wird der Kaffee mit einer Kleinigkeit wie Baklava oder anderen türkischen Köstlichkeiten serviert", "Genieße deinen Mokka :) - p.s. stell sicher, dass du den Kaffeesatz nicht mittrinkst"], tipsonestring: "Die originale Art Kaffee zuzubereiten. Gebe 1 stark gehäuften Teelöffel gemahlenen Kaffee (Mokka-Pulver) mit 1 Tasse Wasser und 1 Teelöffel Zucker in eine türkische Mokkatopf, den sogenannten Cezva, rühr alles gut um und lass das Wasser kochen. Sei vorsichtig: Entferne den Cezva vom Herd, wenn der Schaum zum Rand hin ansteigt und der Kaffee kocht. Ohne zu filtern, gebe den gesamten Mokka in die vorgewärmte Tasse. Oft wird der Kaffee mit einer Kleinigkeit wie Baklava oder anderen türkischen Köstlichkeiten serviert. Genieße deinen Mokka :) - p.s. stell sicher, dass du den Kaffeesatz nicht mittrinkst")
        ]
        
        self.title = "Zubereitung"
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
    }
    
    
    // MARK: - Private instance methods
    
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
