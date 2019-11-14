//
//  CalculateGpa.swift
//  Ricah_764947_gapApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class CalculateGpa: UIViewController {

    @IBOutlet weak var course1: UILabel!
    @IBOutlet weak var course2: UILabel!
    @IBOutlet weak var course3: UILabel!
    @IBOutlet weak var course4: UILabel!
    @IBOutlet weak var course5: UILabel!
    
    @IBOutlet weak var course1_txt: UITextField!
    @IBOutlet weak var course2_txt: UITextField!
    @IBOutlet weak var course3_txt: UITextField!
    @IBOutlet weak var course4_txt: UITextField!
    @IBOutlet weak var course5_txt: UITextField!
    
    var total : Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...4{
            
            //var temp_count = 
            
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculate(_ sender: Any) {
       
        
    }
    func get_credit(Course : String) -> Int {
         
        let temp : String = String(Course.dropFirst(Course.count - 1))
        return Int(temp) ?? 0
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
