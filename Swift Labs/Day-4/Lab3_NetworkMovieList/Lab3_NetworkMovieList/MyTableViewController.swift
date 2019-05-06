//
//  MyTableViewController.swift
//  Lab3_NetworkMovieList
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 Mai. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    var Url : URL?
    var request : URLRequest?
    var session : URLSession?
    var jsonArray : Array<Dictionary<String,Any>>?
    var myMovie = Movie(title: "", image: "", rating: 0.0, releaseYear: 0, genre: [""])
    
    var objArray : [Movie] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Url = URL(string: "https://api.androidhive.info/json/movies.json")!
        request = URLRequest(url: Url!)
        
        session = URLSession(configuration: URLSessionConfiguration.default)
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
                    cell.textLabel?.text = dictionary["title"] as! String
                }
                for dictionary in self.jsonArray!{
                    self.myMovie.title = dictionary["title"] as! String
                    self.myMovie.image = dictionary["image"] as! String
                    self.myMovie.releaseYear = dictionary["releaseYear"] as! Int
                    self.myMovie.rating = dictionary["rating"] as! Double
                    self.myMovie.genre = dictionary["genre"] as! [String]
                
                self.objArray.append(self.myMovie)
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
        detailsVC.setMovieDetailsValues(comingMovie: objArray[(self.tableView.indexPathForSelectedRow?.row)!])
    }
    

}
