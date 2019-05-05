//
//  SecondViewController.swift
//  DelegateDemo
//
//  Created by JETS Mobile Lab on 5/5/19.
//  Copyright © 2019 MaiAlaa. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var str : String = ""
    var firstVC : ClearProtocol?
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = str
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func clearText(_ sender: UIBarButtonItem) {
        firstVC?.clearText()
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
