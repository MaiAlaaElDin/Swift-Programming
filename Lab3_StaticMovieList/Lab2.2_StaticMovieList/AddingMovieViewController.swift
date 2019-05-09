//
//  AddingMovieViewController.swift
//  Lab2.2_StaticMovieList
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 Mai. All rights reserved.
//

import UIKit

class AddingMovieViewController: UIViewController {
    
    @IBOutlet weak var imageTextField: UITextField!
    

    @IBOutlet weak var titleTextField: UITextField!
    
    
    @IBOutlet weak var ratingTextField: UITextField!
    
    
    @IBOutlet weak var releaseyearTextField: UITextField!
    
    @IBOutlet weak var genreTextField: UITextField!
    
    var moviesListVC : AddProtocol?
    
    var newMovie = Movie(title: "", image: "", rating: 0.0, releaseYear: 0, genre: [""] )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func doneAddingMovie(_ sender: UIBarButtonItem) {
        newMovie.title = titleTextField.text!
        newMovie.genre = [String(genreTextField.text!)]
        newMovie.image = imageTextField.text!
        newMovie.releaseYear = Int(releaseyearTextField.text!)!
        newMovie.rating = Float(ratingTextField.text!)!
        
        moviesListVC?.addNewMovie(newMovie: newMovie)
        self.navigationController?.popViewController(animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
