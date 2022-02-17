//
//  DatabaseHelper.swift
//  DBAssignment2
//
//  Created by Neosoft on 07/02/22.
//
import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    //SAVE
    func save(object:[String:Any]){
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User
        user.firstName = object["firstName"] as? String
        user.lastName = object["lastName"] as? String
        user.phone = object["phone"] as? String
        user.email = object["email"] as? String
        user.gender = object["gender"] as? String
        user.password = object["password"] as? String
        user.dateOfBirth = object["dateOfBirth"] as? String
        user.education = object["education"] as? String
        user.photo = object["photo"] as? Data
        do{
            try context?.save()
        }catch{
            print("Error in saving data")
        }
    }
    
    //FETCH
    func getUserData() -> [User]{
        var user = [User]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        do{
            user = try context?.fetch(fetchRequest) as! [User]
            //print(user)
        }catch{
            print("Cannot get data")
        }
        return user
    }
}
