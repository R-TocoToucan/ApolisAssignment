//
//  DBManager.swift
//  Lululemon
//
//  Created by Minseok Choi on 10/13/21.
//

import Foundation
import UIKit
import CoreData


class DBManager {
    static let shared = DBManager()
    private init(){}
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
 
    func fetchData(sort: NSSortDescriptor) -> [Garment] {
        var garments: [Garment] = []
        // Fetch the data from Core Data to display in the tableView
        do {
            let fetchRequest = NSFetchRequest<Garment>(entityName: "Garment")
            fetchRequest.sortDescriptors = [sort]
            garments = try self.context.fetch(fetchRequest)
            
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return garments
    }
    
    func saveData(name: String) {
        // Create a garment object
        let newGarment = Garment.init(context: self.context)
        newGarment.name = name
        newGarment.creationTime = Date()
        
        // Save the data
        do {
            try self.context.save()
        } catch let error as NSError {
            print("Something went wrong")
        }
    }
    
    func deleteData(garment: Garment) {
        // Remove the garment
        self.context.delete(garment)

        // Save the data
        do {
            try self.context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
