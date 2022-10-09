//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    // 3. Определить наиболее часто встречающийся тип животного
    // 4. Отобразить результаты в соответствии с этим животным
    var answersChosen: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        let mappedAnimals = answersChosen.map { ($0.animal, 1) }
        let animalsFrequency = Dictionary(mappedAnimals, uniquingKeysWith: +).sorted { $0.1 > $1.1 }
        print(animalsFrequency.first ?? "error")
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
