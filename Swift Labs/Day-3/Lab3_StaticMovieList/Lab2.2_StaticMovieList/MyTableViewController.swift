//
//  MyTableViewController.swift
//  Lab2.2_StaticMovieList
//
//  Created by Esraa Hassan on 5/5/19.
//  Copyright © 2019 Mai. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController , AddProtocol {

    var moviesArr : [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let obj1 = Movie(title:"The Last Samurai", image: "1.jpg", rating: 7.7, releaseYear: 2003, genre: ["Action", "Drama", "History"] )
        
        let obj2 = Movie(title:"Dawn of the Planet of the Apes", image: "2.jpg", rating: 8.3, releaseYear: 2014, genre:["Action, ", "Drama, ", "Sci-Fi"] )
        
        let obj3 = Movie(title:"District 9", image: "3.jpg", rating: 8.0, releaseYear: 2009, genre:["Action, ", "Sci-Fi, ", "Thriller"] )
        
        let obj4 = Movie(title:"Transformers: Age of Extinction", image: "4.jpg", rating: 6.3, releaseYear: 2017, genre:["Action, ", "Sci-Fi, ", "Thriller"] )
        
        let obj5 = Movie(title:"The Amazing Spider-Man 2", image: "5.jpg", rating: 7.3, releaseYear: 2014, genre:["Action, ", "Adventure, ", "Fantasy"] )
        
        moviesArr = [obj1,obj2,obj3,obj4,obj5]
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
        return moviesArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = moviesArr[indexPath.row].title

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

//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let movieDetailsVC = segue.destination as? ViewController
        {
            movieDetailsVC.setValues(comingMovie: moviesArr[(tableView.indexPathForSelectedRow?.row)!])
        }
        else {
            _ = segue.destination as? AddingMovieViewController
            
        }
    }
    
    
    func addNewMovie(newMovie: Movie) {
        moviesArr.append(newMovie)
        self.tableView.reloadData()
    }
    

}
