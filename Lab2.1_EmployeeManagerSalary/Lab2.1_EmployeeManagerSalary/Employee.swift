//
//  Employee.swift
//  Lab2.1_EmployeeManagerSalary
//
//  Created by Esraa Hassan on 5/5/19.
//  Copyright © 2019 Mai. All rights reserved.
//

import UIKit

class Employee: Person {
    override func getSalary(salary: Double) -> Double{
        return salary * 1.5;
    }
    
}
