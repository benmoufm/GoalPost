//
//  ViewController.swift
//  GoalPost
//
//  Created by Mélodie Benmouffek on 24/01/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import UIKit

class GoalsViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Actions
    @IBAction func addGoalButtonPressed(_ sender: Any) {
        guard let createGoalViewController =
            storyboard?.instantiateViewController(withIdentifier: "createGoalViewController")
            else { return }
        presentDetail(createGoalViewController)
    }
}

