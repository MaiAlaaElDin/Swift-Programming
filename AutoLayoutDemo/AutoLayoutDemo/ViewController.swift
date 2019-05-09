//
//  ViewController.swift
//  AutoLayoutDemo
//
//  Created by JETS Mobile Lab on 5/9/19.
//  Copyright © 2019 MaiAlaa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var classAObj : ClassA = ClassA()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        classAObj.x = 10;
        print(classAObj.x)
    }


}

