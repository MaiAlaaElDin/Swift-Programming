//
//  MyTableViewController.swift
//  Lab3_NetworkMovieList
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 Mai. All rights reserved.
//

import UIKit
import CoreData


class MyTableViewController: UITableViewController {
    
    var Url : URL?
    var request : URLRequest?
    var session : URLSession?
    var jsonArray : Array<Dictionary<String,Any>>?
    var myMovie = Movie(title: "", image: "", rating: 0.0, releaseYear: 0)
    
    var objArray : [Movie] = []
    var moviesArray = Array<NSManagedObject>()
    
    var appDelegate : AppDelegate?
    var managerContext : NSManagedObjectContext?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Url = URL(string: "https://api.androidhive.info/json/movies.json")!
        request = URLRequest(url: Url!)
        
        session = URLSession(configuration: URLSessionConfiguration.default)
        
        appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        managerContext = appDelegate?.persistentContainer.viewContext
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        
        let task = session?.dataTask(with: request!, completionHandler: { (data, response, error) in
            
            do{
                self.jsonArray = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? Array<Dictionary<String,Any>>
                
                var dictionary = self.jsonArray![indexPath.row]
                DispatchQueue.main.async {
                    cell.textLabel?.text = (dictionary["title"] as! String)
                }
                for dictionary in self.jsonArray!{
                
                    self.myMovie = Movie(title: dictionary["title"] as! String,
                        image: dictionary["image"] as! String, rating: dictionary["rating"] as! Double,
                        releaseYear: dictionary["releaseYear"] as! Int )
                    
                    self.objArray.append(self.myMovie)
                    
                    //Save to Core Data
                    var movieCoreDataObj : NSManagedObject = self.addInCoreData(newMovie: self.myMovie)
                    
                    
                }
            }
            catch{
                print("Error in Task!")
            }
        }).resume()
        

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let detailsVC = segue.destination as! ViewController
        //if
            //{
                detailsVC.setMovieDetailsValues(comingMovie: objArray[(self.tableView.indexPathForSelectedRow?.row)!])
       // }
       // else{
        //detailsVC.setValuesFromCoreData(comingMovie: moviesArray[(self.tableView.indexPathForSelectedRow?.row)!])
       // }
    }
    
    
    func addInCoreData(newMovie: Movie) -> NSManagedObject {
        
        let entity = NSEntityDescription.entity(forEntityName: "MovieEntity", in: managerContext!)
        let myNewMovie = NSManagedObject(entity: entity!, insertInto: managerContext)
        
        myNewMovie.setValue(newMovie.title, forKey: "title")
        myNewMovie.setValue(newMovie.image, forKey: "image")
        myNewMovie.setValue(newMovie.rating, forKey: "rating")
        myNewMovie.setValue(newMovie.releaseYear, forKey: "releaseYear")
        //myNewMovie.setValue(newMovie.genre, forKey: "genre")
        
        do{
            try managerContext?.save()
        }
        catch {
            print("Error!")
        }
        return myNewMovie
    }
    
    func fetchFromCoreData() {
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MovieEntity")
        do{
            moviesArray = (try managerContext?.fetch(fetchRequest))!
        }catch{
            print("Error")
        }
    }
    
    

}
