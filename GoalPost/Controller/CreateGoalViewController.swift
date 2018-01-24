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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK : - Actions
    @IBAction func longTermButtonPressed(_ sender: Any) {
    }

    @IBAction func shortTermButtonPressed(_ sender: Any) {
    }

    @IBAction func nextButtonPressed(_ sender: Any) {
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        dismissDetail()
    }
}
