//
//  MVVMViewController.swift
//  DifferenceMVVM-MVC
//
//  Created by Diego Sierra on 02/08/23.
//

import UIKit

class MVVMViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    var viewModel = TaskViewModel()
   
    @IBAction func modifyLabels(_ sender: UIButton) {
        viewModel.modifyTaskStatus()
        updateUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    func updateUI() {
        self.titleLabel.text = viewModel.taskTitle
        self.statusLabel.text = viewModel.taskStatus
    }
    
    
}
