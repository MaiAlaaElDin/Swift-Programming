//
//  AddingMovieViewController.swift
//  Lab2.2_StaticMovieList
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 Mai. All rights reserved.
//

import UIKit
import CoreData

class AddingMovieViewController: UIViewController {
    
    @IBOutlet weak var imageTextField: UITextField!
    

    @IBOutlet weak var titleTextField: UITextField!
    
    
    @IBOutlet weak var ratingTextField: UITextField!
    
    
    @IBOutlet weak var releaseyearTextField: UITextField!
    
    @IBOutlet weak var genreTextField: UITextField!
    
    var moviesListVC : AddProtocol?
    
    var newMovie = Movie(title: "", image: "", rating: 0.0, releaseYear: 0, genre: "" )
    
    var testTitle : String = ""
    var counter : Int = 0
    var appDelegate : AppDelegate?
    var managerContext : NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        managerContext = appDelegate?.persistentContainer.viewContext
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func doneAddingMovie(_ sender: UIBarButtonItem) {
//        newMovie.title = titleTextField.text!
        testTitle = titleTextField.text!
        newMovie.genre = String(genreTextField.text!)
        newMovie.image = imageTextField.text!
        newMovie.releaseYear = Int(releaseyearTextField.text!)!
        newMovie.rating = Float(ratingTextField.text!)!
        
        var movieCoreDataObj : NSManagedObject = addInCoreData(newMovie: newMovie)
        moviesListVC?.addNewMovie(newMovie: movieCoreDataObj)
        self.navigationController?.popViewController(animated: true)
    }
    
    func addInCoreData(newMovie: Movie) -> NSManagedObject {
        
        let entity = NSEntityDescription.entity(forEntityName: "MovieEntity", in: managerContext!)
        let myNewMovie = NSManagedObject(entity: entity!, insertInto: managerContext)
        
        myNewMovie.setValue(testTitle, forKey: "title")
        myNewMovie.setValue(newMovie.image, forKey: "image")
        myNewMovie.setValue(newMovie.rating, forKey: "rating")
        myNewMovie.setValue(newMovie.releaseYear, forKey: "releaseYear")
        myNewMovie.setValue(newMovie.genre, forKey: "genre")
        
        do{
            try managerContext?.save()
        }
            catch {
                print("Error!")
            }
        return myNewMovie
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
