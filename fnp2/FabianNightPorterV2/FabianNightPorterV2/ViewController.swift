//
//  ViewController.swift
//  FabianNightPorterV2
//
//  Created by Fabian Williams on 11/24/17.
//  Copyright © 2017 Fabian G. Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Create task arrays
//    let dailyTasks = ["Check all windows",
//                      "Check all doors",
//                      "Check temperature of freezer",
//                      "Check the mailbox at the end of the lane",
//                      "Empty trash containers",
//                      "If freezing, check water pipes outside"]
//
//    let weeklyTasks = ["Check inside all unoccupied cabins",
//                       "Run all faucets for 30 seconds",
//                       "Walk the perimeter of property",
//                       "Arrange for dumpster pickup"]
//
//    let twoWeekTasks = ["Run test on security alarm",
//                        "Check all motion detectors",
//                        "Test smoke alarms"]
    
    var dailyTasks = [
        Task(name: "Check all windows", type: .Daily, completed: true, lastCompleted: nil),
        Task(name: "Check all doors", type: .Daily, completed: true, lastCompleted: nil),
        Task(name: "Check temperature of freezer", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Check the mailbox at the end of the lane", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Empty trash containers", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "If freezing, check water pipes outside", type: .Daily, completed: false, lastCompleted: nil)
    ]
    var weeklyTasks = [
        Task(name: "Check inside all unoccupied cabins", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Run all faucets for 30 seconds", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Walk the perimeter of property", type: .Daily, completed: true, lastCompleted: nil),
        Task(name: "Arrange for dumpster pickup", type: .Daily, completed: true, lastCompleted: nil)
        ]
    var twoWeekTasks = [
        Task(name: "Run test on security alarm", type: .Daily, completed: true, lastCompleted: nil),
        Task(name: "Check all motion detectors", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Test smoke alarms", type: .Daily, completed: false, lastCompleted: nil)
        ]
    
    @IBAction func toggleDarkMode(_ sender: Any) {
        let darkModeSwitch = sender as! UISwitch
        if darkModeSwitch.isOn {
            view.backgroundColor = UIColor.darkGray
        }
        else {
            view.backgroundColor = UIColor.white
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //adding the below because the toggle in the above switch action
        //will be obscured by the original color of the table view
        //this way below will make the tableview Clear color
        tableView.backgroundColor = UIColor.clear
        return 3
    }
    
    //going to create an outlet here for the table view so i can reference it in the
    //reset list action. this is because inside that Action i dont have access to TableView
    
    @IBOutlet weak var taskTableViewOutlet: UITableView!
    
    //using the below action on the Reset Toolbar Button to reset the list
    @IBAction func resetList(_ sender: Any) {
        
        //This is a sanity check Dialog box that will give the person an OUT
        //if they dont want to take this destrutive duty
        let confirm = UIAlertController(title: "No Turning Back", message: "Are you really sure you want to reset this list", preferredStyle: .alert)
        
        //We need to wire up the actual actions we want to invoke. in our case its a Yes and No Click
        let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: {
            action in
            for i in 0..<self.dailyTasks.count {
                self.dailyTasks[i].completed = false
            }
            for i in 0..<self.weeklyTasks.count {
                self.weeklyTasks[i].completed = false
            }
            for i in 0..<self.twoWeekTasks.count {
                self.twoWeekTasks[i].completed = false
            }
            self.taskTableViewOutlet.reloadData()
        })
        let noAction = UIAlertAction(title: "No", style: .default, handler: {
            action in
            print("ok. we wont do that")
        })
        
        //Actually add both the Yes and No ACtion to the UIAlert Controller
        confirm.addAction(yesAction)
        confirm.addAction(noAction)
        
        //Now Show the Controller to the user
        //old version had presentViewController but that is no longer used
        present(confirm, animated: true, completion: nil)
        
//We moved this to inside the Yes action becasue its only if the person selects YES
//do we actualy want to reset the list. Also we have to use 'self' moniker as its running on a sepearte tread
//        for i in 0..<dailyTasks.count {
//            dailyTasks[i].completed = false
//        }
//        for i in 0..<weeklyTasks.count {
//            weeklyTasks[i].completed = false
//        }
//        for i in 0..<twoWeekTasks.count {
//            twoWeekTasks[i].completed = false
//        }
//        taskTableViewOutlet.reloadData()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return twoWeekTasks.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //Cant use String anymore because we are using a Task Object now
//        var currentTask: String
        var currentTask: Task!
        
        switch indexPath.section {
        case 0:
            currentTask = dailyTasks[indexPath.row]
        case 1:
            currentTask = weeklyTasks[indexPath.row]
        case 2:
            currentTask = twoWeekTasks[indexPath.row]
        default:
            //currentTask = ""
            break
        }
        //cant use the below anymore since this is no longer a String
        //cell.textLabel!.text = currentTask
        
        //using the below now because this a Task object
        cell.textLabel!.text = currentTask.name
        
        //Lets use some OOB check mark to show if an item is completed or not and affect the color of it too
        if currentTask.completed {
            cell.textLabel?.textColor = UIColor.lightGray
            cell.accessoryType = .checkmark
        }
        else {
            cell.textLabel?.textColor = UIColor.black
            cell.accessoryType = .checkmark
            cell.accessoryType = .none
        }
        
        //setting the below for teh seame reason in line 41
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    //the below method (Delegate) is added so that the Section Header will be dark
    //while in Dark mode. It was white otherwise
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.gray  //this is better than background color after experiments.
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Bi Weekly Tasks"
        default:
            return "Catch All"
        }
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row: \(indexPath.row) in selection: \(indexPath.section)")
    }
    
    //the below Delegate Method is used to allow User Input actions on a Row. We will use it for the user
    //to mark an item complete
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let myAction = UITableViewRowAction(style: .default, title: "Complete", handler: {
            //closure parameters expect two params
            action, indexPath in
            //find the right object and set it. basially we have sections and it needs to set the complete boolean to true
            //the resulting action will be that a check mark will appear next to the item that had the complete button clicked
            switch  indexPath.section {
            case 0:
                self.dailyTasks[indexPath.row].completed = true
            case 1:
                self.weeklyTasks[indexPath.row].completed = true
            case 2:
                self.twoWeekTasks[indexPath.row].completed = true
            default:
                break
            }
            //refresh the list
            tableView.reloadData()
            //let the table view know after the person marks complete that they are done
            //i.e. the button is gone
            tableView.isEditing = false
        })
            let actions = [myAction]
        return actions
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

