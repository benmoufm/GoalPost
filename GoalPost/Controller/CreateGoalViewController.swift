//
//  CreateGoalViewController.swift
//  GoalPost
//
//  Created by Mélodie Benmouffek on 24/01/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import UIKit

class CreateGoalViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!

    //MARK: - Variables
    var goalType: GoalType = .shortTerm

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.bindToKeyboard()
        shortTermButton.setSelectedColor()
        longTermButton.setDeselectedColor()
    }

    //MARK : - Actions
    @IBAction func longTermButtonPressed(_ sender: Any) {
        goalType = .longTerm
        longTermButton.setSelectedColor()
        shortTermButton.setDeselectedColor()
    }

    @IBAction func shortTermButtonPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermButton.setSelectedColor()
        longTermButton.setDeselectedColor()
    }

    @IBAction func nextButtonPressed(_ sender: Any) {
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        dismissDetail()
    }
}
