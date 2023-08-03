//
//  MVCViewController.swift
//  DifferenceMVVM-MVC
//
//  Created by Diego Sierra on 02/08/23.
//

import UIKit

class MVCViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    var task = Task(title: "Bye", completed: false)
    
    @IBAction func modifyLabels(_ sender: UIButton) {
        task.completed.toggle()
        if task.completed {
            self.task.title = "Hello"
        } else {
            self.task.title = "Bye"
        }
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    func updateUI() {
        self.titleLabel.text = task.title
        self.statusLabel.text = task.completed ? "Completed" : "Pending"
    }
    
    
}
