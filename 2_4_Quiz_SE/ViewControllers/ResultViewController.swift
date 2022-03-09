//
//  ResultViewController.swift
//  2_4_Quiz_SE
//
//  Created by Arsalan Balzhinimaev on 22.02.2022.
//

import UIKit

class ResultViewController: UIViewController {

	@IBOutlet var youAreLabel: UILabel!
	@IBOutlet var definitionLabel: UILabel!
	
	var answers: [Answer]!

	private var whichAnimal: Animal!

    override func viewDidLoad() {
        super.viewDidLoad()

		navigationItem.hidesBackButton = true
		getAnimal(from: answers)

    }
}

// MARK: - Private methods
extension ResultViewController {
	private func getAnimal(from answers: [Answer]) {

		var frequencyOfAnimal: [Animal: Int] = [:]
		let animals = answers.map { $0.animal }

		for animal in animals {
			if let animalTypeCount = frequencyOfAnimal[animal] {
				frequencyOfAnimal.updateValue(animalTypeCount + 1, forKey: animal)
			} else {
				frequencyOfAnimal[animal] = 1
			}
		}

		let sortedFrequencyOfAnimals = frequencyOfAnimal.sorted { $0.value > $1.value }
		guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }

		updateUI(with: mostFrequencyAnimal)
	}

	private func updateUI(with animal: Animal) {
		youAreLabel.text = "Вы - \(animal.rawValue)"
		definitionLabel.text = animal.definition
	}
}
