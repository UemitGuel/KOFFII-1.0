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
        knowledges = [
            Knowledge(name: "Coffee water", imageName: "Water", tips: ["Water with a pH value of 7.0 and a total hardness of approx. 4 - 8°d is ideal for preparing coffee", "https://www.wasserhaerte.net/ here you check the water hardness ( at least for Germany, Switzerland, Austria, and Belgium )", "If your water is too hard, you can use a table water filter to soften it"], tipsonestring: "Water with a pH value of 7.0 and a total hardness of approx. 4 - 8°d is ideal for preparing coffee. https://www.wasserhaerte.net/ here you check the water hardness ( at least for Germany, Switzerland, Austria, and Belgium ). If your water is too hard, you can use a table water filter to soften it"),
            Knowledge(name: "Health", imageName: "Health", tips: ["In the short-term caffeine has a diuretic effect, but regular coffee drinkers get used to the caffeine intake. If you take coffee regularly, your fluid balance will be effected solely by the amount of water supplied with the coffee", "Caffeine takes between 30 - 45 minutes to enter the bloodstream and has a half-life of about 4 hours", "Caffeine stimulates, in small doses, the heart and circulatory system, increases physical performance and increases concentration. Additionally, it can improve your mood. Recent studies showing that lifelong coffee consumption can reduce the risk of depression and age-related decline in mental performance", "Yes, I could be biased :D", "The downside of too much caffeine: can lead to potassium deficiency, muscle problems, fatigue and headaches"], tipsonestring: "In the short-term caffeine has a diuretic effect, but regular coffee drinkers get used to the caffeine intake. If you take coffee regularly, your fluid balance will be effected solely by the amount of water supplied with the coffee. Caffeine takes between 30 - 45 minutes to enter the bloodstream and has a half-life of about 4 hours. Caffeine stimulates, in small doses, the heart and circulatory system, increases physical performance and increases concentration. Additionally, it can improve your mood. Recent studies showing that lifelong coffee consumption can reduce the risk of depression and age-related decline in mental performance. Yes, I could be biased :D. The downside of too much caffeine: can lead to potassium deficiency, muscle problems, fatigue and headaches"),
            Knowledge(name: "History of Coffee", imageName: "History", tips: ["The word \"coffee\" comes from the word koffie (Dutch), which was taken from the Ottomans Turkish word kahve, which was taken from the Arabic gahwah", "According to the legends, the shepherd Kaldi notices that his goats are jumping upside down the whole night after eating the red coffee cherries. Intrigued by it, Kaldi finds the fruit himself and start chewing them. Amazed and afraid by the effects, he brings the berries to a monk in a nearby monastery. The monk, who never see something like this before, is afraid that this could be the work of the devil and therefore threw them into the fire, from which a seductive aroma rises, causing the monk and Kaldi to investigate further", "Coffee was first mentioned in the Kaffa region of southwest Ethiopia in 900 A.D. The ethnic group (nowadays called Oromo) gave their tribesman coffee to be better hunters", "From there it found his way to Turkey: Ethiopia → Yemen → Mecca, Medina → Cairo, Damascus, Baghdad and Constantinople (15 hundred)", "But in the Islamic world drinking coffee wasn´t mainly for pleasure, it was directly connected to religious practices. It should help to fast in the day and stay awake at night during Ramadan", "Drinking coffee spread to Italy, before it got passed to the rest of Europe. After, the Dutch Republic started exporting coffee beans to the East Indies and to the Americas"], tipsonestring: "The word \"coffee\" comes from the word koffie (Dutch), which was taken from the Ottomans Turkish word kahve, which was taken from the Arabic gahwah. According to the legends, the shepherd Kaldi notices that his goats are jumping upside down the whole night after eating the red coffee cherries. Intrigued by it, Kaldi finds the fruit himself and start chewing them. Amazed and afraid by the effects, he brings the berries to a monk in a nearby monastery. The monk, who never see something like this before, is afraid that this could be the work of the devil and therefore threw them into the fire, from which a seductive aroma rises, causing the monk and Kaldi to investigate further. Coffee was first mentioned in the Kaffa region of southwest Ethiopia in 900 A.D. The ethnic group (nowadays called Oromo) gave their tribesman coffee to be better hunters. From there it found his way to Turkey: Ethiopia → Yemen → Mecca, Medina → Cairo, Damascus, Baghdad and Constantinople (15 hundred). But in the Islamic world drinking coffee wasn´t mainly for pleasure, it was directly connected to religious practices. It should help to fast in the day and stay awake at night during Ramadan. Drinking coffee spread to Italy, before it got passed to the rest of Europe. After, the Dutch Republic started exporting coffee beans to the East Indies and to the Americas"),
            Knowledge(name: "Production", imageName: "Fabrication", tips: ["There just two types of coffee which became important for the world market: \"Arabica\" and \"Robusta\". Arabica plants account for around 70% of the global coffee cultures", "Coffee seeds are generally planted in large beds in shaded nurseries. They need ideally rainfall of around 1500 - 2000 liters per square meter and plenty of sunlight", "The fruit, called the coffee cherry, turns a bright, deep red when it is ripe and ready to be harvested. Usually, there is one major harvest a year. Picking the crop is often done by hand and is a labor-intensive and difficult process", "Quickly after picking processing must begin to prevent fruit spoilage. Coffee is processed in one of two ways:", "1. The Dry Methode: The freshly picked cherries are spread simply out on huge surfaces to dry in the sun. This process can take several weeks and ends when the moisture content of the cherries drops to 11 - 12 %", "2. The Wet Method: After harvesting, the pulp is being removed from the coffee cherry so the bean is dried with only the parchment skin left on. Then the beans are getting separated by weight and then passed through a series of rotating drums which separate them by size. After separation, the beans are transported to large, water-filled fermentation tanks. While laying in the tanks, naturally occurring enzymes will cause the slick layer of mucilage that is still attached to the parchment to dissolve. After fermentation, they are ready for drying", "Before the coffee can be exported in shipping containers, it has to be hulled, polished and sorted", "Samples of the coffee are tested for quality and taste daily. Not just to determine their characteristics, but also for creating the proper roast. This process is called cupping and usually takes place in a specially designed room", "Roasting takes place in the importing country because the freshly roasted beans must reach the consumer asap. Most roasting machines maintain a temperature of about 287° degrees. After reaching around 200° degrees the beans are starting to turn brown and the caffeol, a fragant oil from inside the bean, begins to appear. This process produces the aroma of the coffee we drink. The beans are getting cooled after the roasting process immediately by water or air", "After this, just grinding and preparing your coffee is missing from you and your cup of delicious coffee"],tipsonestring: "There just two types of coffee which became important for the world market: \"Arabica\" and \"Robusta\". Arabica plants account for around 70% of the global coffee cultures. Coffee seeds are generally planted in large beds in shaded nurseries. They need ideally rainfall of around 1500 - 2000 liters per square meter and plenty of sunlight. The fruit, called the coffee cherry, turns a bright, deep red when it is ripe and ready to be harvested. Usually, there is one major harvest a year. Picking the crop is often done by hand and is a labor-intensive and difficult process. Quickly after picking processing must begin to prevent fruit spoilage. Coffee is processed in one of two ways:. 1. The Dry Methode: The freshly picked cherries are spread simply out on huge surfaces to dry in the sun. This process can take several weeks and ends when the moisture content of the cherries drops to 11 - 12 %. 2. The Wet Method: After harvesting, the pulp is being removed from the coffee cherry so the bean is dried with only the parchment skin left on. Then the beans are getting separated by weight and then passed through a series of rotating drums which separate them by size. After separation, the beans are transported to large, water-filled fermentation tanks. While laying in the tanks, naturally occurring enzymes will cause the slick layer of mucilage that is still attached to the parchment to dissolve. After fermentation, they are ready for drying. Before the coffee can be exported in shipping containers, it has to be hulled, polished and sorted. Samples of the coffee are tested for quality and taste daily. Not just to determine their characteristics, but also for creating the proper roast. This process is called cupping and usually takes place in a specially designed room. Roasting takes place in the importing country because the freshly roasted beans must reach the consumer asap. Most roasting machines maintain a temperature of about 287° degrees. After reaching around 200° degrees the beans are starting to turn brown and the caffeol, a fragant oil from inside the bean, begins to appear. This process produces the aroma of the coffee we drink. The beans are getting cooled after the roasting process immediately by water or air. After this, just grinding and preparing your coffee is missing from you and your cup of delicious coffee"),
            Knowledge(name: "Regions", imageName: "Regions", tips: ["Brazil - the South American country with tropical climate is with the production of more than 30% of the world´s traded coffee export-champion", "Brazil - The coffee beans are harvested predominantly by hand and drying out in the blazing sun", "Brazil - The main costumer are USA and Europe, especially Germany", "Brazil - Since Brazil is using more and more pesticides in production, there is are some concerns about negative health effects in the long term", "Brazil - The flavour is predominantly mild with little acidity", "Colombia - The coffee from the third largest coffee exporter is known for its high quality and purity", "Colombia - The Tinto, how a typical Colombian bitter coffee is called, is usually drunk black, without milk or sugar", "Colombia - For the most part the coffee is grown in Caldas, Risaralda, and Quinidio - also known as the \"coffee triangle of Colombia\"", "Colombia - Coffee is the main source of income for around 500.000 Colombians", "Ethiopia - the birthplace of coffee", "Ethiopia - The work by hand guarantees highest quality, because only ripe fruits are harvested", "Ethiopia - To produce larger quantities can be processed while maintaining the high quality, small farmers often organize themselves in cooperations", "Ethiopia - Ethiopia is one of the poorest countries in the world. 85 percent of jobs are closely linked to coffee production, and around 60 percent of government revenue comes from the export of coffee beans", "Vietnam - Vietnam became the second biggest coffee exporter in the world", "Vietnam - 90% of the planted coffee is Robusta, which is particularly resistant to pests and thrives even under the worst conditions, even if the coffee farmer does not know exactly what he is doing. This could be the reason why it is not considered to produce high-quality coffee", "Vietnam - In Vietnam, they drink a ca phe nau (brown coffee) or ca phe sua (milk coffee), which is cold coffee with condensed milk. The condensed milk dates back to earlier times when it was difficult to cool food"], tipsonestring: "Brazil - the South American country with tropical climate is with the production of more than 30% of the world´s traded coffee export-champion. Brazil - The coffee beans are harvested predominantly by hand and drying out in the blazing sun. Brazil - The main costumer are USA and Europe, especially Germany. Brazil - Since Brazil is using more and more pesticides in production, there is are some concerns about negative health effects in the long term. Brazil - The flavour is predominantly mild with little acidity. Colombia - The coffee from the third largest coffee exporter is known for its high quality and purity. Colombia - The Tinto, how a typical Colombian bitter coffee is called, is usually drunk black, without milk or sugar. Colombia - For the most part the coffee is grown in Caldas, Risaralda, and Quinidio - also known as the \"coffee triangle of Colombia\". Colombia - Coffee is the main source of income for around 500.000 Colombians. Ethiopia - the birthplace of coffee. Ethiopia - The work by hand guarantees highest quality, because only ripe fruits are harvested. Ethiopia - To produce larger quantities can be processed while maintaining the high quality, small farmers often organize themselves in cooperations. Ethiopia - Ethiopia is one of the poorest countries in the world. 85 percent of jobs are closely linked to coffee production, and around 60 percent of government revenue comes from the export of coffee beans. Vietnam - Vietnam became the second biggest coffee exporter in the world. Vietnam - 90% of the planted coffee is Robusta, which is particularly resistant to pests and thrives even under the worst conditions, even if the coffee farmer does not know exactly what he is doing. This could be the reason why it is not considered to produce high-quality coffee. Vietnam - In Vietnam, they drink a ca phe nau (brown coffee) or ca phe sua (milk coffee), which is cold coffee with condensed milk. The condensed milk dates back to earlier times when it was difficult to cool food"),
            Knowledge(name: "Storage", imageName: "Storage", tips: ["You should use pre-ground coffee within 2 weeks because it loses quickly its aroma", "Store your coffee in a dark, dry and cool place", "Use a package with an aroma valve, which allows gases from the coffee to escape without air entering", "Don´t store your coffee in the fridge, because it can easily absorb moisture and foreign aromas"], tipsonestring: "You should use pre-ground coffee within 2 weeks because it loses quickly its aroma. Store your coffee in a dark, dry and cool place. Use a package with an aroma valve, which allows gases from the coffee to escape without air entering. Don´t store your coffee in the fridge, because it can easily absorb moisture and foreign aromas")
        ]
        self.title = "Knowledge"
        searchController.searchBar.placeholder = "Search.."

    }
    
    func setupDE() {
        knowledges = [
            Knowledge(name: "Wasser", imageName: "Water", tips: ["Wasser mit einem pH-Wert von 7,0 und einer Gesamthärte von ca. 4 - 8°d ist ideal für die Kaffeezubereitung", "https://www.wasserhaerte.net/ Hier kannst du die Wasserhärte überprüfen(zumindest für Deutschland, Schweiz, Österreich und Belgien)", "Wenn das Wasser zu hart ist, kannst du einen Wasserfilter verwenden, um es zu enthärten"], tipsonestring: "Wasser mit einem pH-Wert von 7,0 und einer Gesamthärte von ca. 4 - 8°d ist ideal für die Kaffeezubereitung. https://www.wasserhaerte.net/ Hier kannst du die Wasserhärte überprüfen(zumindest für Deutschland, Schweiz, Österreich und Belgien). Wenn das Wasser zu hart ist, kannst du einen Wasserfilter verwenden, um es zu enthärten"),
            Knowledge(name: "Gesundheit", imageName: "Health", tips: ["Kurzfristig hat Koffein eine harntreibende Wirkung, aber regelmäßige Kaffeetrinker gewöhnen sich an die Koffeinzufuhr. Wenn du regelmäßig Kaffee trinkst, wird deine Flüssigkeitsbilanz nur durch die Wassermenge beeinflusst, die mit Kaffee zugeführt wird", "Koffein benötigt zwischen 30 - 45 Minuten um in den Blutkreislauf zu gelangen und hat eine Halbwertszeit von ca. 4 Stunden", "Koffein stimuliert in kleinen Dosen das Herz und den Kreislauf, erhöht die körperliche Leistungsfähigkeit und erhöht die Konzentration. Außerdem kann es Ihre Stimmung verbessern. Neuere Studien zeigen, dass lebenslanger Kaffeekonsum das Risiko von Depressionen und altersbedingten Leistungseinbußen verringern kann", "Ja, ich könnte parteiisch sein :D", "Der Nachteil von zu viel Koffein: kann zu Kaliummangel, Muskelproblemen, Müdigkeit und Kopfschmerzen führen"], tipsonestring: "Kurzfristig hat Koffein eine harntreibende Wirkung, aber regelmäßige Kaffeetrinker gewöhnen sich an die Koffeinzufuhr. Wenn du regelmäßig Kaffee trinkst, wird deine Flüssigkeitsbilanz nur durch die Wassermenge beeinflusst, die mit Kaffee zugeführt wird. Koffein benötigt zwischen 30 - 45 Minuten um in den Blutkreislauf zu gelangen und hat eine Halbwertszeit von ca. 4 Stunden. Koffein stimuliert in kleinen Dosen das Herz und den Kreislauf, erhöht die körperliche Leistungsfähigkeit und erhöht die Konzentration. Außerdem kann es Ihre Stimmung verbessern. Neuere Studien zeigen, dass lebenslanger Kaffeekonsum das Risiko von Depressionen und altersbedingten Leistungseinbußen verringern kann. Ja, ich könnte parteiisch sein :D. Der Nachteil von zu viel Koffein: kann zu Kaliummangel, Muskelproblemen, Müdigkeit und Kopfschmerzen führen"),
            Knowledge(name: "Geschichte", imageName: "History", tips: ["Das Wort \"Kaffee\" kommt von dem Wort koffie (niederländisch), das aus dem türkischen Wort kahve der Osmanen stammt, das wiederrum aus dem arabischen Wort gahwah kommt", "Den Legenden zufolge bemerkt der Hirte Kaldi, dass seine Ziegen die ganze Nacht über nicht schlafen konnten, nachdem sie die roten Kaffeekirschen gegessen haben. Von dieser Bohne fasziniert, findet Kaldi die Frucht selbst und beginnt sie zu kauen. Er ist zu gleich erstaunt und ängstlich über die Auswirkungen und bringt die Beeren zu einem Mönch in einem nahegelegenen Kloster. Der Mönch, der so etwas noch nie gesehen hat, hat Angst, dass dies das Werk des Teufels sein könnte und warf sie deshalb ins Feuer, aus dem ein verführerisches Aroma aufsteigt, das den Mönch und Kaldi veranlasst  weitere Untersuchungen durchzuführen", "Kaffee wurde erstmals 900 n. Chr. in der Region Kaffa im Südwesten Äthiopiens erwähnt. Die Volksgruppe (heute Oromo genannt) gab ihrem Stammesangehörigen Kaffee, um bessere Jäger zu sein", "Von da aus breitete es sich aus: Äthiopien → Jemen → Mekka, Medina → Kairo, Damaskus, Bagdad und Konstantinopel (15 Jahrhundert)", "In der islamischen Welt hat man Kaffee nicht hauptsächlich zum Vergnügen getrunken, sondern es war mit religiösen Praktiken verbunden. Es sollte helfen, tagsüber zu fasten und nachts während des Ramadans wach zu bleiben", "Das Kaffee trinken verbreitete sich nach Italien, bevor es sich im Rest von Europa verteilte. Danach begann die niederländische Republik mit dem Export von Kaffeebohnen nach Ostindien und nach Amerika"], tipsonestring: "Das Wort \"Kaffee\" kommt von dem Wort koffie (niederländisch), das aus dem türkischen Wort kahve der Osmanen stammt, das wiederrum aus dem arabischen Wort gahwah kommt. Den Legenden zufolge bemerkt der Hirte Kaldi, dass seine Ziegen die ganze Nacht über nicht schlafen konnten, nachdem sie die roten Kaffeekirschen gegessen haben. Von dieser Bohne fasziniert, findet Kaldi die Frucht selbst und beginnt sie zu kauen. Er ist zu gleich erstaunt und ängstlich über die Auswirkungen und bringt die Beeren zu einem Mönch in einem nahegelegenen Kloster. Der Mönch, der so etwas noch nie gesehen hat, hat Angst, dass dies das Werk des Teufels sein könnte und warf sie deshalb ins Feuer, aus dem ein verführerisches Aroma aufsteigt, das den Mönch und Kaldi veranlasst  weitere Untersuchungen durchzuführen. Kaffee wurde erstmals 900 n. Chr. in der Region Kaffa im Südwesten Äthiopiens erwähnt. Die Volksgruppe (heute Oromo genannt) gab ihrem Stammesangehörigen Kaffee, um bessere Jäger zu sein. Von da aus breitete es sich aus: Äthiopien → Jemen → Mekka, Medina → Kairo, Damaskus, Bagdad und Konstantinopel (15 Jahrhundert). In der islamischen Welt hat man Kaffee nicht hauptsächlich zum Vergnügen getrunken, sondern es war mit religiösen Praktiken verbunden. Es sollte helfen, tagsüber zu fasten und nachts während des Ramadans wach zu bleiben. Das Kaffee trinken verbreitete sich nach Italien, bevor es sich im Rest von Europa verteilte. Danach begann die niederländische Republik mit dem Export von Kaffeebohnen nach Ostindien und nach Amerika"),
            Knowledge(name: "Verarbeitung", imageName: "Fabrication", tips: ["Es gibt nur zwei Kaffeesorten, die für den Weltmarkt relevant sind: \"Arabica\" und \"Robusta\". Arabica-Bohnen machen rund 70% der globalen Kaffeekulturen aus", "Kaffeebüsche benötigen idealerweise eine Regenmenge von ca. 1500 - 2000 Liter pro Quadratmeter und viel Sonnenlicht", "Die Frucht, die Kaffeekirsche genannt wird, wird hellrot wenn sie reif und erntefertig ist. Normalerweise gibt es eine große Ernte pro Jahr. Die Ernte erfolgt oft von Hand und ist ein arbeitsintensiver und schwieriger Prozess", "Schnell nach der Ernte muss die Verarbeitung beginnen, um den Verderb der Früchte zu verhindern. Der Kaffee wird auf eine von zwei Arten verarbeitet:", "Die Trockenmethode: Die frisch gepflückten Kirschen werden einfach auf riesige Flächen ausgebreitet, um an der Sonne zu trocknen. Dieser Prozess kann mehrere Wochen dauern und endet, wenn der Feuchtigkeitsgehalt der Kirschen auf 11 - 12 % sinkt", "Die Nassmethode: Nach der Ernte wird das Fruchtfleisch von der Kaffeekirsche entfernt, so dass die Bohne getrocknet wird, wobei nur die Pergamenthaut erhalten bleibt. Dann werden die Bohnen nach Gewicht getrennt und durchlaufen dann eine Reihe von rotierenden Trommeln, die sie nach Größe trennen. Nach der Trennung werden die Bohnen in große, mit Wasser gefüllte Gärtanks transportiert. Während sie in den Tanks liegen, bewirken natürlich vorkommende Enzyme, dass sich die glatte Schleimschicht, die noch am Pergament haftet, auflöst. Nach der Gärung sind sie bereit zur Trocknung", "Bevor der Kaffee in Transportbehälter exportiert werden kann, muss er geschält, poliert und sortiert werden", "Die Proben des Kaffees werden täglich auf Qualität und Geschmack geprüft. Nicht nur, um ihre Eigenschaften zu bestimmen, sondern auch, um den richtigen Verarbeitungsprozess zu wählen", "Die Röstung erfolgt im Importland, da die frisch gerösteten Bohnen so schnell wie möglich beim Verbraucher ankommen müssen. Die meisten Röstmaschinen haben eine Temperatur von etwa 287° Grad. Nach etwa 200° Grad fangen die Bohnen an, braun zu werden und der Kaffee, ein duftendes Öl aus dem Inneren der Bohne, beginnt zu erscheinen. Dieser Prozess erzeugt das Aroma des Kaffees, den wir trinken. Die Bohnen werden nach dem Röstprozess sofort mit Wasser oder Luft gekühlt", "Danach fehlt dir und deiner Tasse köstlichem Kaffee nur noch das Mahlen und Zubereiten deines Kaffees"], tipsonestring: "Es gibt nur zwei Kaffeesorten, die für den Weltmarkt relevant sind: \"Arabica\" und \"Robusta\". Arabica-Bohnen machen rund 70% der globalen Kaffeekulturen aus. Kaffeebüsche benötigen idealerweise eine Regenmenge von ca. 1500 - 2000 Liter pro Quadratmeter und viel Sonnenlicht. Die Frucht, die Kaffeekirsche genannt wird, wird hellrot wenn sie reif und erntefertig ist. Normalerweise gibt es eine große Ernte pro Jahr. Die Ernte erfolgt oft von Hand und ist ein arbeitsintensiver und schwieriger Prozess. Schnell nach der Ernte muss die Verarbeitung beginnen, um den Verderb der Früchte zu verhindern. Der Kaffee wird auf eine von zwei Arten verarbeitet:. Die Trockenmethode: Die frisch gepflückten Kirschen werden einfach auf riesige Flächen ausgebreitet, um an der Sonne zu trocknen. Dieser Prozess kann mehrere Wochen dauern und endet, wenn der Feuchtigkeitsgehalt der Kirschen auf 11 - 12 % sinkt. Die Nassmethode: Nach der Ernte wird das Fruchtfleisch von der Kaffeekirsche entfernt, so dass die Bohne getrocknet wird, wobei nur die Pergamenthaut erhalten bleibt. Dann werden die Bohnen nach Gewicht getrennt und durchlaufen dann eine Reihe von rotierenden Trommeln, die sie nach Größe trennen. Nach der Trennung werden die Bohnen in große, mit Wasser gefüllte Gärtanks transportiert. Während sie in den Tanks liegen, bewirken natürlich vorkommende Enzyme, dass sich die glatte Schleimschicht, die noch am Pergament haftet, auflöst. Nach der Gärung sind sie bereit zur Trocknung. Bevor der Kaffee in Transportbehälter exportiert werden kann, muss er geschält, poliert und sortiert werden. Die Proben des Kaffees werden täglich auf Qualität und Geschmack geprüft. Nicht nur, um ihre Eigenschaften zu bestimmen, sondern auch, um den richtigen Verarbeitungsprozess zu wählen. Die Röstung erfolgt im Importland, da die frisch gerösteten Bohnen so schnell wie möglich beim Verbraucher ankommen müssen. Die meisten Röstmaschinen haben eine Temperatur von etwa 287° Grad. Nach etwa 200° Grad fangen die Bohnen an, braun zu werden und der Kaffee, ein duftendes Öl aus dem Inneren der Bohne, beginnt zu erscheinen. Dieser Prozess erzeugt das Aroma des Kaffees, den wir trinken. Die Bohnen werden nach dem Röstprozess sofort mit Wasser oder Luft gekühlt. Danach fehlt dir und deiner Tasse köstlichem Kaffee nur noch das Mahlen und Zubereiten deines Kaffees"),
            Knowledge(name: "Regionen", imageName: "Regions", tips: ["Brasilien - das südamerikanische Land mit tropischem Klima ist mit der Produktion von mehr als 30% des weltweiten Kaffees der Kaffee-Exportmeister", "B - Die Kaffeebohnen werden überwiegend von Hand geerntet und trocknen in der prallen Sonne", "B - Die Hauptkunden sind die USA und Europa, insbesondere Deutschland", "B - Da Brasilien immer mehr Pestizide in der Produktion verwendet, gibt es einige Bedenken hinsichtlich negativer gesundheitlicher Auswirkungen auf lange Sicht", "B - Der Geschmack ist überwiegend mild mit wenig Säure", "Kolumbien - Der Kaffee des drittgrößten Kaffeeexporteurs ist bekannt für seine hohe Qualität und Reinheit", "K - Der Tinto, wie ein typischer kolumbianischer Bitterkaffee genannt wird, wird meist schwarz getrunken, ohne Milch und Zucker", "K - Der Kaffee wird größtenteils in Caldas, Risaralda und Quinidio angebaut - auch bekannt als das \"Kaffeedreieck Kolumbiens\"", "K - Kaffee ist die Haupteinnahmequelle für rund 500.000 Kolumbianer", "Äthiopien - die Geburtsstätte des Kaffees", "Ä - Die Handarbeit garantiert höchste Qualität, da nur reife Früchte geerntet werden", "Ä - Um größere Mengen unter Beibehaltung der hohen Qualität verarbeiten zu können, organisieren sich Kleinbauern oft in Kooperationen", "Ä - Äthiopien ist eines der ärmsten Länder der Welt. 85 Prozent der Arbeitsplätze sind eng mit der Kaffeeproduktion verbunden, und rund 60 Prozent der Staatseinnahmen stammen aus dem Export von Kaffeebohnen", "Vietnam - Vietnam wurde zum zweitgrößten Kaffeeexporteur der Welt", "V - 90% des angebauten Kaffees ist Robusta, der besonders schädlingsresistent ist und auch unter den schlimmsten Bedingungen gedeiht, auch wenn der Kaffeebauer nicht genau weiß, was er tut. Dies könnte der Grund dafür sein, dass dem Kaffee aus Vietnam nicht die höchste Qualität zugesprochen wird", "V - In Vietnam trinken sie einen ca phe nau (brauner Kaffee) oder ca phe sua (Milchkaffee), was kalter Kaffee mit Kondensmilch ist. Die Kondensmilch stammt aus früheren Zeiten, als es schwierig war, Lebensmittel zu kühlen"], tipsonestring: "Brasilien - das südamerikanische Land mit tropischem Klima ist mit der Produktion von mehr als 30% des weltweiten Kaffees der Kaffee-Exportmeister. Brasilien - Die Kaffeebohnen werden überwiegend von Hand geerntet und trocknen in der prallen Sonne. Brasilien - Die Hauptkunden sind die USA und Europa, insbesondere Deutschland. Brasilien - Da Brasilien immer mehr Pestizide in der Produktion verwendet, gibt es einige Bedenken hinsichtlich negativer gesundheitlicher Auswirkungen auf lange Sicht. Brasilien - Der Geschmack ist überwiegend mild mit wenig Säure. Kolumbien - Der Kaffee des drittgrößten Kaffeeexporteurs ist bekannt für seine hohe Qualität und Reinheit. Kolumbien - Der Tinto, wie ein typischer kolumbianischer Bitterkaffee genannt wird, wird meist schwarz getrunken, ohne Milch und Zucker. Kolumbien - Der Kaffee wird größtenteils in Caldas, Risaralda und Quinidio angebaut - auch bekannt als das \"Kaffeedreieck Kolumbiens\". Kolumbien - Kaffee ist die Haupteinnahmequelle für rund 500.000 Kolumbianer. Äthiopien - die Geburtsstätte des Kaffees. Äthiopien - Die Handarbeit garantiert höchste Qualität, da nur reife Früchte geerntet werden. Äthiopien - Um größere Mengen unter Beibehaltung der hohen Qualität verarbeiten zu können, organisieren sich Kleinbauern oft in Kooperationen. Äthiopien - Äthiopien ist eines der ärmsten Länder der Welt. 85 Prozent der Arbeitsplätze sind eng mit der Kaffeeproduktion verbunden, und rund 60 Prozent der Staatseinnahmen stammen aus dem Export von Kaffeebohnen. Vietnam - Vietnam wurde zum zweitgrößten Kaffeeexporteur der Welt. Vietnam - 90% des angebauten Kaffees ist Robusta, der besonders schädlingsresistent ist und auch unter den schlimmsten Bedingungen gedeiht, auch wenn der Kaffeebauer nicht genau weiß, was er tut. Dies könnte der Grund dafür sein, dass dem Kaffee aus Vietnam nicht die höchste Qualität zugesprochen wird. Vietnam - In Vietnam trinken sie einen ca phe nau (brauner Kaffee) oder ca phe sua (Milchkaffee), was kalter Kaffee mit Kondensmilch ist. Die Kondensmilch stammt aus früheren Zeiten, als es schwierig war, Lebensmittel zu kühlen"),
            Knowledge(name: "Lagerung", imageName: "Storage", tips: ["Du solltest vorgemahlenen Kaffee innerhalb von 2 Wochen verwenden, da er sein Aroma schnell verliert", "Lager deinen Kaffee an einem dunklen, trockenen und kühlen Ort", "Verwende eine Verpackung mit einem Aromaventil, damit Gase aus dem Kaffee entweichen können, ohne dass Luft eindringt", "Lager deinen Kaffee nicht im Kühlschrank, da er Feuchtigkeit und Fremdaromen leicht aufnehmen kann"], tipsonestring: "Du solltest vorgemahlenen Kaffee innerhalb von 2 Wochen verwenden, da er sein Aroma schnell verliert. Lager deinen Kaffee an einem dunklen, trockenen und kühlen Ort. Verwende eine Verpackung mit einem Aromaventil, damit Gase aus dem Kaffee entweichen können, ohne dass Luft eindringt. Lager deinen Kaffee nicht im Kühlschrank, da er Feuchtigkeit und Fremdaromen leicht aufnehmen kann")
        ]
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
