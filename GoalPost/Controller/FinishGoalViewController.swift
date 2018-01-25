//
//  FinishGoalViewController.swift
//  GoalPost
//
//  Created by Mélodie Benmouffek on 25/01/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class FinishGoalViewController: UIViewController, UITextFieldDelegate {
    //MARK: - Outlets
    @IBOutlet weak var createGoalButton: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!

    //MARK: - Variables
    var goalDescription: String!
    var goalType: GoalType!

    override func viewDidLoad() {
        super.viewDidLoad()
        pointsTextField.delegate = self
        createGoalButton.bindToKeyboard()
    }

    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }

    func save(completion: (_ success: Bool) -> Void) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext
            else {
                completion(false)
                return
        }
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgressValue = 0
        do {
            try managedContext.save()
            completion(true)
        } catch {
            debugPrint("Could not save : \(error.localizedDescription)")
            completion(false)
        }
    }

    //MARK: - Actions
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismissDetail()
    }

    @IBAction func createGoalButtonPressed(_ sender: Any) {
        if pointsTextField.text != "" {
            save { (success) in
                if success {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
}
