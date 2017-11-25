//
//  Task.swift
//  FabianNightPorterV2
//
//  Created by Fabian Williams on 11/25/17.
//  Copyright © 2017 Fabian G. Williams. All rights reserved.
//

import Foundation

enum TaskType {
    case Daily, Weekly, TwoWeeks, Monthly
}

struct Task {
    var name: String
    var type: TaskType
    var completed: Bool
    var lastCompleted: NSDate?
}
