//
//  ViewController.swift
//  NetworkingDemo
//
//  Created by JETS Mobile Lab on 5/5/19.
//  Copyright © 2019 MaiAlaa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func startTask(_ sender: UIButton) {
        
        let url = URL(string: "https://api.androidhive.info/json/movies.json")
        let request = URLRequest(url: url!)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            do{
                var output = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Array<Dictionary<String,Any>>
                var dictionary = output[0]
                print(dictionary["title"]!)
                //self.myLabel.text = dictionary["title"] as! String //runtime warning
                
                DispatchQueue.main.async {
                    self.myLabel.text = dictionary["title"] as? String
                }
                
            }catch{
                print("Error")
            }
        }.resume()
        
    }
}

