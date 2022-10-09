//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var answerTitle: UILabel!
    @IBOutlet var answerText: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        let mappedAnimals = answersChosen.map { ($0.animal, 1) }
        let animalsFrequency = Dictionary(mappedAnimals, uniquingKeysWith: +).sorted { $0.1 > $1.1 }
        if let animalResult = animalsFrequency.first?.key {
            updateUI(for: animalResult)
        }
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    private func updateUI(for animal: Animal) {
        answerTitle.text = "Вы - \(animal.rawValue)"
        answerText.text = animal.definition
    }
}
