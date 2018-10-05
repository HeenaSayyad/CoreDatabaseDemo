//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by ramjan sayyad on 27/09/18.
//  Copyright © 2018 ramjan sayyad. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var empId: UITextField!
    
    
    @IBOutlet weak var empName: UITextField!
    
   
    
    @IBOutlet weak var gender: UITextField!
    
    
    @IBOutlet weak var mobileNo: UITextField!
    
    
    
    @IBOutlet weak var qualification: UITextField!
    
   
    
    
    
//
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveAction(_ sender: Any) {
        
        if ((empId?.text) != nil) && ((empName?.text) != nil) &&  ((gender?.text) != nil)  && ((qualification?.text) != nil) && ((mobileNo?.text) != nil){
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        
        let empId_Str = self.empId!.text
        let empId_Int = Int(empId_Str!)
        newUser.setValue(empId_Int, forKey: "empId")
            
        newUser.setValue(self.empName!.text, forKey: "empName")
        newUser.setValue(self.gender!.text, forKey: "gender")
        newUser.setValue(self.mobileNo!.text, forKey: "mobileNo")
        newUser.setValue(self.qualification!.text, forKey: "qualification")
            
            let alert = UIAlertController(title: "Message", message: "Your Information is been Saved", preferredStyle: .alert)
            
            let dissmiss = UIAlertAction(title: "Dismiss", style: .cancel, handler: {
                (alert:UIAlertAction) -> Void in
                
            })
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: {
                (alert:UIAlertAction) -> Void in
              
            })
            alert.addAction(dissmiss)
            alert.addAction(okButton)
            present(alert,animated: true,completion: nil)

            
            
        
        do
        {
            try context.save()
            print("Information is been Saved")
        }
        catch
        {
            print(error)
        }
        
        }
        else
        {
            print("Fill at the fields")
        }
        
        
        
        
        
        
        
        
    }
    }
    


