//
//  GoalTableViewCell.swift
//  GoalPost
//
//  Created by Mélodie Benmouffek on 24/01/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import UIKit

class GoalTableViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var goalProgressLabel: UILabel!

    func configureCell(goal: Goal) {
        self.goalDescriptionLabel.text = goal.goalDescription
        self.goalTypeLabel.text = goal.goalType
        self.goalProgressLabel.text = String(describing: goal.goalProgressValue)
    }
}
