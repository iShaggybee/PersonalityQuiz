//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        showResult()
    }
    
    private func showResult() {
        let animal = getProbableAnimal()
        
        animalLabel.text = animal != nil ? "Вы - \(animal!.rawValue)" : "Вы - доселе неизвестное науке существо"
        descriptionLabel.text = animal?.definition ?? ""
    }
    
    private func getProbableAnimal() -> Animal? {
        var frequencyOfAnimals = [Animal: Int]()
        
        for answer in answers {
            if let _ = frequencyOfAnimals[answer.animal] {
                frequencyOfAnimals[answer.animal]! += 1
            } else {
                frequencyOfAnimals[answer.animal] = 1
            }
        }
        
        
        let sortedFrequency = frequencyOfAnimals.sorted { $0.value > $1.value}
        
        return sortedFrequency.first?.key
    }
}
