//
//  TableTableViewController.swift
//  CoreDataDemo
//
//  Created by JETS Mobile Lab on 5/7/19.
//  Copyright © 2019 MaiAlaa. All rights reserved.
//

import UIKit
import CoreData

class TableTableViewController: UITableViewController {
    //var movies = Array<Movie>()
    var counter = 1
    var movies = Array<NSManagedObject>()
    
    @IBAction func addMovieAction(_ sender: UIBarButtonItem) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managerContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: managerContext)
        
        let movie = NSManagedObject(entity: entity!, insertInto: managerContext)
        
        movie.setValue("Movie \(counter)", forKey: "title")
        movie.setValue(5.7, forKey: "rate")
        movie.setValue(2000, forKey: "releaseDate")
        counter+=1
        
        do{
            try managerContext.save()
            movies.append(movie)
            self.tableView.reloadData()
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        
        //        movies.append(
        //            (title: "Movie \(counter)", releaseDate: 2002, rate: 5.0),
        //            (title: "Movie \(counter)", releaseDate: 2003, rate: 5.0))
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //Fetch data from Core Data
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managerContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movie")
        
        do{
            //Fetch returns an array
            movies = try managerContext.fetch(fetchRequest)
        }catch {
            print("Error")
        }
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        
        //cell.textLabel?.text = movies[indexPath.row].title
        
        cell.textLabel?.text = movies[indexPath.row].value(forKey: "title") as? String

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            let managerContext = appDelegate.persistentContainer.viewContext
            
            managerContext.delete(movies[indexPath.row])
            
            //Remove from the array
            movies.remove(at: indexPath.row)
            do{
                try managerContext.save()
            } catch{
                   print("Error")
                }
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
