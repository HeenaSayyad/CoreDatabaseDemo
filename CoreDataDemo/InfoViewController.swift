//
//  InfoViewController.swift
//  CoreDataDemo
//
//  Created by ramjan sayyad on 02/10/18.
//  Copyright © 2018 ramjan sayyad. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    
    @IBOutlet weak var infotableView: UITableView!
    
//     var userArray1:[User] = []
    var selectedRow:[User] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  self.fetchData()
        
        print("selectedRow==%@", selectedRow)

        self.infotableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

      //  print("indexPath.row==", indexPath.row)

        let emp = selectedRow[0]
        
        if indexPath.row == 0 {
            cell.textLabel?.text = String(emp.empId)
        } else if indexPath.row == 1 {
            cell.textLabel?.text = emp.empName
        }  else if indexPath.row == 2 {
            cell.textLabel?.text = emp.gender
        }else if indexPath.row == 3 {
            cell.textLabel?.text = emp.mobileNo
        }else if indexPath.row == 4 {
            cell.textLabel?.text = emp.qualification
        }

        return cell
    }
    
//    func fetchData()
//    {
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
//        do{
//            userArray1 = try context.fetch(User.fetchRequest())
//        }
//        catch{
//            print(error)
//        }
//    }
//

}
