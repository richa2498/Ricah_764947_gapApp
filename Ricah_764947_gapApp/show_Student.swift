//
//  show_Student.swift
//  Ricah_764947_gapApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class show_Student: UITableViewController,UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        filterStuds(for:searchController.searchBar.text ?? "")
    }
    let searchController = UISearchController(searchResultsController: nil)
    var FilterStudent = [Students]()
    @IBOutlet var studTabl: UITableView!
    var index : Int = -1
    @IBOutlet weak var uisearchbar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
      
      
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.tintColor = UIColor.white
 
        
    }

    private func filterStuds(for searchText: String) {
        FilterStudent = Students.student_data.filter({ (Students) in
            return Students.first_Name.lowercased().contains(searchText.lowercased())
        })
        reloadTable()
    }
  
    

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive && searchController.searchBar.text != "" {
            
            return FilterStudent.count
        }
        return  Students.student_data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cgpa :Double = 0.0
        let cell = tableView.dequeueReusableCell(withIdentifier: "student", for: indexPath)
        if searchController.isActive && searchController.searchBar.text != "" {
            cell.textLabel?.text =  " \(FilterStudent[indexPath.row].first_Name)"
        }
        else{
                        cell.textLabel?.text =  " \(Students.student_data[indexPath.row].first_Name)"
                        
                      if Students.student_data[indexPath.row].sem1_cgpa != 0.0  && Students.student_data[indexPath.row].sem2_cgpa != 0.0  && Students.student_data[indexPath.row].sem3_cgpa != 0.0  {
                            
                            cgpa = (Students.student_data[indexPath.row].sem1_cgpa + Students.student_data[indexPath.row].sem2_cgpa + Students.student_data[indexPath.row].sem3_cgpa) / 3
                            
                        }
                        else if Students.student_data[indexPath.row].sem1_cgpa != 0.0  && Students.student_data[indexPath.row].sem2_cgpa != 0.0  {
                    
                            cgpa = (Students.student_data[indexPath.row].sem1_cgpa + Students.student_data[indexPath.row].sem2_cgpa) / 2
                        
                      }
                    else if Students.student_data[indexPath.row].sem1_cgpa != 0.0 {
                              
                              cgpa = Students.student_data[indexPath.row].sem1_cgpa
                              
                    }
        }
        
        if cgpa > 2.8 {
             cell.detailTextLabel?.text = String(format: "%.2f 🌟", cgpa)
        }else{
        cell.detailTextLabel?.text = String(format: "%.2f", cgpa)
        }
         return cell
  
    }
    
    
    func reloadTable(){
        studTabl.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        reloadTable()
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if let reload_data = segue.destination as? AddStudents{
            
            reload_data.showStudDelegete = self
            
        }else{
                
                if let sendIndex = segue.destination as? SemChooseViewController{
                    sendIndex.delegeteAddstud = self
                    if let cell = sender as? UITableViewCell{
                        
                        index = tableView.indexPath(for: cell)!.row
                        
                    }
            }
            
        }
        
    }
    

}
