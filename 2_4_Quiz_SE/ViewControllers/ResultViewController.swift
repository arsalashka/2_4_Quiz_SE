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
		whichAnimal = getAnimal(from: answers)
		youAreLabel.text = "Вы - \(whichAnimal.rawValue)"
		definitionLabel.text = whichAnimal.definition
    }
}

// MARK: - Private methods
extension ResultViewController {
	
	private func animalCounter(for animal: Animal, in answers: [Answer]) -> Int {
		var count = 0

		for answer in answers {
			if answer.animal == animal {
				count += 1
			}
		}
		return count
	}

	private func getAnimal(from answers: [Answer]) -> Animal {

		let dogs = animalCounter(for: .dog, in: answers)
		let cats = animalCounter(for: .cat, in: answers)
		let rabbits = animalCounter(for: .rabbit, in: answers)
		let turtles = animalCounter(for: .turtle, in: answers)

		let max = max(dogs, cats, rabbits, turtles)
		if max == dogs {
			return .dog
		} else if max == cats {
			return .cat
		} else if max == rabbits {
			return .rabbit
		}
		return .turtle
	}
}
