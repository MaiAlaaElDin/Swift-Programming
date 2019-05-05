//
//  ViewController.swift
//  DelegateDemo
//
//  Created by JETS Mobile Lab on 5/5/19.
//  Copyright © 2019 MaiAlaa. All rights reserved.
//

import UIKit

class ViewController: UIViewController , ClearProtocol {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let secondVC = segue.destination as! SecondViewController
        secondVC.firstVC = self
        secondVC.str = textField.text!
        
    }
    
    func clearText(){
        textField.text = "";
    }


}

