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
    @IBOutlet weak var undoView: UIView!
    @IBOutlet weak var undoViewHeightConstraint: NSLayoutConstraint!

    //MARK: - Variables
    var goals = [Goal]()
    var undoViewUp = false

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        addTapGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fetchCoreDataObjects() {
        fetch { (success) in
            if success {
                if goals.count >= 1 {
                    tableView.isHidden = false
                } else {
                    tableView.isHidden = true
                }
            }
        }
    }

    func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissUndoView))
        tableView.addGestureRecognizer(tap)
    }

    //MARK: - Animation functions
    func animateViewUp() {
        undoViewUp = true
        undoViewHeightConstraint.constant = 50
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

    func animateViewDown() {
        undoViewUp = false
        undoViewHeightConstraint.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

    @objc func dismissUndoView() {
        if undoViewUp {
            saveDeletion()
            animateViewDown()
        }
    }

    //MARK: - Actions
    @IBAction func addGoalButtonPressed(_ sender: Any) {
        guard let createGoalViewController =
            storyboard?.instantiateViewController(withIdentifier: "createGoalViewController")
            else { return }
        presentDetail(createGoalViewController)
    }

    @IBAction func undoButtonPressed(_ sender: Any) {
        undoRemoveGoal()
        fetchCoreDataObjects()
        tableView.reloadData()
    }
}

