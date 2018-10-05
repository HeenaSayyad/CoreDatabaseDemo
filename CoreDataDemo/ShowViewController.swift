//
//  ShowViewController.swift
//  CoreDataDemo
//
//  Created by ramjan sayyad on 27/09/18.
//  Copyright © 2018 ramjan sayyad. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableEmpView: UITableView!
    
    var userArray:[User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      self.fetchData()
        self.tableEmpView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let emp = userArray[indexPath.row]
        
//
        
       
        cell.textLabel?.text = String(emp.empId)
        cell.detailTextLabel?.text = emp.empName
        
        
        
       
        
        return cell
    }
    
    
    
    
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       // let next = self.storyboard?.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
       // self.present(next, animated: true, completion: nil)
        
        self.shouldPerformSegue(withIdentifier: "Go2InfoViewcontroller", sender:self)

    }
    
    
    
    
    func fetchData()
    {
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            userArray = try context.fetch(User.fetchRequest())
        }
        catch{
            print(error)
        }
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is InfoViewController
        {
            let cell = sender as! UITableViewCell
            let indexpath = tableEmpView.indexPath(for: cell)
            let vc = segue.destination as? InfoViewController
            vc?.selectedRow = [userArray[(indexpath?.row)!]]
        }
    }

}
