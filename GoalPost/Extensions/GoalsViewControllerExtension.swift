//
//  GoalsViewControllerExtension.swift
//  GoalPost
//
//  Created by Mélodie Benmouffek on 25/01/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import UIKit
import CoreData

extension GoalsViewController {
    func fetch(completion: (_ success: Bool) -> Void) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext
            else {
                completion(false)
                return
        }
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        do {
            goals = try managedContext.fetch(fetchRequest)
            completion(true)
        } catch {
            debugPrint("Could not fetch : \(error.localizedDescription)")
            completion(false)
        }
    }

    func removeGoal(atIndexPath indexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        managedContext.delete(goals[indexPath.row])
        do {
            try managedContext.save()
        } catch {
            debugPrint("Could not remove : \(error.localizedDescription)")
        }
    }

    func setProgress(atIndexPath indexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let chosenGoal = goals[indexPath.row]
        if chosenGoal.goalProgressValue < chosenGoal.goalCompletionValue {
            chosenGoal.goalProgressValue += 1
        } else {
            return
        }
        do {
            try managedContext.save()
        } catch {
            debugPrint("Could not save progress : \(error.localizedDescription)")
        }
    }
}
