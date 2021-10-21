//
//  ListViewModel.swift
//  Lululemon
//
//  Created by Minseok Choi on 10/13/21.
//

import Foundation
import UIKit

protocol ViewModelDelegate {
    func sendValue()
}

class ListViewModel {

    private var garmentList = [Garment]()
    let db = DBManager.shared
    
    func fetchGarmentFromDB(sortIndex: Int) {
        var sort: NSSortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        switch sortIndex {
        case 0:
            sort = NSSortDescriptor(key: "name", ascending: true)
        case 1:
            sort = NSSortDescriptor(key: "creationTime", ascending: true)
        default:
            break
        }
        
        self.garmentList = db.fetchData(sort: sort)
    }
    
    
    func deleteGarmentFromDB(index: Int) {
        if getGarmentsCount() > 0 {
            db.deleteData(garment: garmentList[index])
        }
    }
    
    func getGarmentsCount() -> Int {
        return garmentList.count
    }

    
    func getGarment(index: Int) -> Garment? {
        if getGarmentsCount() > 0 {
            return garmentList[index]
        }
        return nil
    }
    
    func getGarmentName(index: Int) -> String? {
        if getGarmentsCount() > 0 {
            return garmentList[index].name
        }
        return nil
    }
    
    

}
