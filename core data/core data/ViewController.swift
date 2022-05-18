//
//  ViewController.swift
//  core data
//
//  Created by Sina Taherkhani on 6/14/1400 AP.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    let appdelegate=UIApplication.shared.delegate as! AppDelegate
    @IBOutlet var text_age: UITextField!
    @IBOutlet var text_password: UITextField!
    @IBOutlet var text_user: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func save() {
        let context=appdelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        let newUser = NSManagedObject(entity:entity!,insertInto:context)
        newUser.setValue(text_user.text ?? "sina", forKey: "username")
        newUser.setValue(text_password.text ?? "1234", forKey: "password")
        newUser.setValue(text_age.text ?? "28", forKey: "age")
        
        do{
            try context.save()
            print("succes")
            
        }
        catch{
        print("err")
        }
    }
    func fetch(){
        let context=appdelegate.persistentContainer.viewContext
        let req=NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        req.returnsObjectsAsFaults=false
        do{
            let result=try context.fetch(req)
            for data in result as![NSManagedObject] {
                print(data.value(forKey: "username") as! String)
            }
        }catch{
            print("faild")
        }
    }
    @IBAction func btn_pressed(_ sender: Any) {
            fetch()
    }
    

}

