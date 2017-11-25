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
        Task(name: "Check all windows", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Check all doors", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Check temperature of freezer", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Check the mailbox at the end of the lane", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Empty trash containers", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "If freezing, check water pipes outside", type: .Daily, completed: false, lastCompleted: nil)
    ]
    var weeklyTasks = [
        Task(name: "Check inside all unoccupied cabins", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Run all faucets for 30 seconds", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Walk the perimeter of property", type: .Daily, completed: false, lastCompleted: nil),
        Task(name: "Arrange for dumpster pickup", type: .Daily, completed: false, lastCompleted: nil)
        ]
    var twoWeekTasks = [
        Task(name: "Run test on security alarm", type: .Daily, completed: false, lastCompleted: nil),
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
        //cell.textLabel!.text = currentTask
        cell.textLabel!.text = currentTask.name
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

