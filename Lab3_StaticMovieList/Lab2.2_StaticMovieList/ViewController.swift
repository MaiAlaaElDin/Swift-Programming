//
//  ViewController.swift
//  Lab2.2_StaticMovieList
//
//  Created by Esraa Hassan on 5/5/19.
//  Copyright © 2019 Mai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var releaseyearLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    var myMovie = Movie(title: "", image: "", rating: 0.0, releaseYear: 0, genre: [""])
    
    func setValues(comingMovie: Movie){
        myMovie.image = comingMovie.image
        myMovie.genre = comingMovie.genre
        myMovie.releaseYear = comingMovie.releaseYear
        myMovie.title = comingMovie.title
        myMovie.rating = comingMovie.rating
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myImage.image = UIImage(named: myMovie.image)
        titleLabel.text = myMovie.title
        ratingLabel.text = String(myMovie.rating)
        releaseyearLabel.text = String(myMovie.releaseYear)
        genreLabel.text = myMovie.genre[0]+myMovie.genre[1]+myMovie.genre[2]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

