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
}
