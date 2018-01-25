//
//  FinishGoalViewController.swift
//  GoalPost
//
//  Created by Mélodie Benmouffek on 25/01/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import UIKit

class FinishGoalViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var createGoalButton: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - Actions
    @IBAction func createGoalButtonPressed(_ sender: Any) {
        // Pass data into Core Data Goal Model
    }
}
