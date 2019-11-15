//
//  SemChooseViewController.swift
//  Ricah_764947_gapApp
//
//  Created by MacStudent on 2019-11-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class SemChooseViewController: UIViewController {

    var semName : String = ""
    var delegeteAddstud : show_Student?
    var index : Int = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        index = delegeteAddstud!.index
        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func sem1(_ sender: UIButton) {
        semName = "sem1"
        
    }
    
    @IBAction func sem2(_ sender: Any) {
           semName = "sem2"
    }
    
    @IBAction func sem3(_ sender: Any) {
           semName = "sem3"
    }

    
    
    
    
    
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if let sendSem = segue.destination as? CalculateGpa{
            
            sendSem.semChooseDelegate = self
            
        }
    }
  

}
