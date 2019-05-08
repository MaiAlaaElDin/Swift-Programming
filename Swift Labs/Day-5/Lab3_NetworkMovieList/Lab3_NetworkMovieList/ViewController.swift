//
//  ViewController.swift
//  Lab3_NetworkMovieList
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 Mai. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var myImage: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    @IBOutlet weak var yearLabel: UILabel!
    
    
    @IBOutlet weak var genreLabel: UILabel!
    
     var myMovie = Movie(title: "", image: "", rating: 0.0, releaseYear: 0)
    
    func setMovieDetailsValues(comingMovie: Movie)
    {
        myMovie.image = comingMovie.image
        //myMovie.genre = comingMovie.genre
        myMovie.releaseYear = comingMovie.releaseYear
        myMovie.title = comingMovie.title
        myMovie.rating = comingMovie.rating
        
    }
    
    func setValuesFromCoreData(comingMovie: NSManagedObject){
        myMovie.image = comingMovie.value(forKey: "image") as! String
        //myMovie.genre = comingMovie.value(forKey: "genre") as! [String]
        myMovie.releaseYear = comingMovie.value(forKey:"releaseYear") as! Int
        myMovie.title = comingMovie.value(forKey: "title") as! String
        myMovie.rating = Double(comingMovie.value(forKey: "rating") as! Float)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myImage.text = myMovie.image
        titleLabel.text = myMovie.title
        ratingLabel.text = String(myMovie.rating)
        yearLabel.text = String(myMovie.releaseYear)
        //genreLabel.text = myMovie.genre[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

