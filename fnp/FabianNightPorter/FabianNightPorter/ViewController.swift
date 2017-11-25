//
//  ViewController.swift
//  FabianNightPorter
//
//  Created by Fabian Williams on 11/24/17.
//  Copyright © 2017 Fabian G. Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func changeBackground(_ sender: Any) {
        view.backgroundColor = UIColor.darkGray
        
        //below will get all the sub-views in the parent view object
        let allSubViews = view.subviews
        
        //now we will use a FOR-IN loop and the "is" statement to check to see if a particular view is a UILabel
        //we are doing this because we know there is a Button there and we dont want to change the text on the button
        for eachView in allSubViews {
            if eachView is UILabel {
                let myLabel = eachView as! UILabel
                myLabel.textColor = UIColor.lightGray
            }
        }
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

