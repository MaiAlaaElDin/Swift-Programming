//
//  ViewController.swift
//  Lab2.1_EmployeeManagerSalary
//
//  Created by Esraa Hassan on 5/5/19.
//  Copyright © 2019 Mai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var salaryValue : Double = 0.0
    var textStr : String = ""
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBAction func getEmpSalary(_ sender: UIButton) {
        textStr = myTextField.text!
        salaryValue = Double(textStr)!
        var empObj = Employee()
        salaryLabel.text = String(empObj.getSalary(salary: salaryValue))
    }

    @IBAction func getManagerSalary(_ sender: UIButton) {
        textStr = myTextField.text!
        salaryValue = Double(textStr)!
        var managerObj = Manager()
        salaryLabel.text = String(managerObj.getSalary(salary: salaryValue))
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

