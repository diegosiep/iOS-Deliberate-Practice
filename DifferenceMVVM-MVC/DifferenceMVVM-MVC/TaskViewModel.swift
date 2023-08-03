//
//  TaskViewModel.swift
//  DifferenceMVVM-MVC
//
//  Created by Diego Sierra on 02/08/23.
//

import Foundation


class TaskViewModel {
    var task: Task = Task(title: "Bye", completed: false)
    
    var taskTitle: String {
        return task.title
    }
    
    var taskStatus: String  {
        return task.completed ? "Completed" : "Pending"
    }
    
    func modifyTaskStatus() {
        self.task.completed.toggle()
        if task.completed {
            task.title = "Hello"
        } else {
            task.title = "Bye"
        }
    }
    
}
